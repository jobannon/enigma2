require 'date'
require_relative './../test/test_helper'

class Engima
  #class to encrypt and decrypt
  attr_reader :rand_num_array
  def initialize
    @alphabet = ("a".."z").to_a << " "
    @rand_num_array = []
  end

  def encrypt(message, key = helper_generate_random, date = Date.now)

    #returns hash {:encryption, :key, :date}
  end

  def decrypt(message, key, date = Date.now)
    #returns hash with three keys {:decryption, :key, :date}

  end

  def square_date
  end

  def get_rand

    5.times do
      rand_num = rand(5).to_s
      @rand_num_sum = rand_num
    end
    @rand_num_sum
  end

  def get_keys
    #get random number
    get_rand
    #enumerate over random number to generate keys
    a_shift = @rand_num_sum[0..1]
    b_shift = @rand_num_sum[1..2]
    c_shift = @rand_num_sum[2..3]
    d_shift = @rand_num_sum[3..4]

    # rand_num_array.each do |rand_num|
    #
    # end
  end

  def get_last_four
  end

  def create_four_keys
  end

  def create_ciper
  end

end
