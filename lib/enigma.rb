require 'date'
require 'pry'
require_relative './key'
require_relative './../test/test_helper'

class Engima
  #class to encrypt and decrypt
  attr_reader :rand_num_array
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
    create_shift_array(offset, keyholder)
    # message.chars.map do |char|
    #   (@alphabet.index[char] % 27 ) + shift_array.first
    #   shift_array.rotate %  4
    # end
    #returns hash {:encryption, :key, :date}
  end

  def create_shift_array(offset, keyholder)
    binding.pry
    @shift_array << (offset.a_offset + keyholder.a_key)
    @shift_array << (offset.b_offset + keyholder.b_key)
    @shift_array << (offset.c_offset + keyholder.c_key)
    @shift_array << (offset.d_offset + keyholder.d_key)
  end

  def decrypt(message, key, date = Date.now)
    #returns hash with three keys {:decryption, :key, :date}

  end

  def get_keys
    #get random number
    get_rand
    #enumerate over random number to generate keys
    @a_shift = @rand_num_sum[0..1]
    @b_shift = @rand_num_sum[1..2]
    @c_shift = @rand_num_sum[2..3]
    @d_shift = @rand_num_sum[3..4]

    # rand_num_array.each do |rand_num|
    #
    # end
  end
end
