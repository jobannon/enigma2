require 'date'
require_relative './key.rb'
require_relative './../test/test_helper'

class Engima
  #class to encrypt and decrypt
  attr_reader :rand_num_array, :shift_array #not sure I want to expose :shift_array for testing
  def initialize(key, offset)
    @alphabet = ("a".."z").to_a << " "
    @rand_num_array = []
    @shift_array = []
    @keyholder = key
    @offset = offset
  end

  def encrypt(message, key = Key.new, date = Time.now.strftime("%d%m%Y"))
    this_key = Key.new(key)
    message = message.downcase #per requirements
    @offset.create_offsets(date)
    shift_array = create_shift_array(@offset, this_key)

    # shift_message(message, shift_array)

    this_back = {}
    this_back[:encryption] = shift_message(message, shift_array)
    this_back[:key] = key.rand_num_string
    this_back[:date] = date
    this_back
  end

  def create_shift_array(offset, keyholder)
    @shift_array << (offset.a_offset + keyholder.a_key)
    @shift_array << (offset.b_offset + keyholder.b_key)
    @shift_array << (offset.c_offset + keyholder.c_key)
    @shift_array << (offset.d_offset + keyholder.d_key)
  end

  def shift_message(message, shift_array)
    ciper_message = message.chars.reduce([]) do |acc, message_char|
      acc << @alphabet[((@alphabet.index(message_char) + @shift_array.first)%27)]
      @shift_array.rotate!
      acc
    end
    ciper_message.join
  end

  def decrypt(message, key, date = Date.now)
    #returns hash with three keys {:decryption, :key, :date}
  end
end
