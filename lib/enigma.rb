require 'date'
require_relative './../test/test_helper'
class Engima
  #class to encrypt and decrypt
  def initialize
    @alphabet = ("a".."z").to_a << " "
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
    rand_num_array = []
    5.times do
      rand_num = rand(5)
      rand_num_array << rand_num
    end
    rand_num_array
  end

  def get_last_four
  end

  def create_four_keys
  end

  def create_ciper
  end

end
