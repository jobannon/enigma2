require 'date'
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
  end

  def get_last_four
  end

  def create_four_keys
  end

  def create_ciper
  end

end
