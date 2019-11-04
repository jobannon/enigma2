require 'date'
require 'pry'
require_relative './key'
require_relative './offset'
require_relative './../test/test_helper'

class Engima
  #class to encrypt and decrypt
  attr_reader :rand_num_array, :shift_array #not sure I want to expose :shift_array for testing
  def initialize
    @alphabet = ("a".."z").to_a << " "
    @rand_num_array = []
    @d_shift = 0
    @shift_array = []
  end

  def encrypt(message, key = Key.new, date = Date.now)
    # create_ciper(message)
    keyholder = Key.new(key)
    offset = Offset.new
    offset.create_offsets(date)
    shift_array = create_shift_array(offset, keyholder)
    shift_message(message, shift_array)
    # message.chars.map do |char|
    #   (@alphabet.index[char] % 27 ) + shift_array.first
    #   shift_array.rotate %  4
    # end
    #returns hash {:encryption, :key, :date}
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

  def create_ciper
  end
end
