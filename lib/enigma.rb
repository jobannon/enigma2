require 'date'
require_relative './key'
require_relative './offset'
require 'pry'

class Enigma
  attr_reader :rand_num_array, :shift_array #not sure I want to expose :shift_array for testing
  def initialize
    @alphabet = ("a".."z").to_a << " "
    @rand_num_array = []
    @shift_array = []

    @keyholder = Key.new
    @offset = Offset.new
  end

  def encrypt(message, key = Key.new, date = Time.now.strftime("%d%m%Y"))
    this_key = Key.new(key)
    message = message.downcase #per requirements
    @offset.create_offsets(date)
    create_shift_array(@offset, this_key)
    {
     :encryption => shift_message(message, "+"),
     :key => this_key.rand_num_string,
     :date => date
    }
  end

  def decrypt(message, key, date = Time.now.strftime("%d%m%Y"))
    this_key = Key.new(key)
    message = message.downcase #per requirements
    @offset.create_offsets(date)
    create_shift_array(@offset, this_key)
    {
      :decryption => shift_message(message, '-'),
      :key => this_key.rand_num_string,
      :date => date
    }
  end

  def create_shift_array(offset, keyholder)
    @shift_array << (offset.a_offset + keyholder.a_key)
    @shift_array << (offset.b_offset + keyholder.b_key)
    @shift_array << (offset.c_offset + keyholder.c_key)
    @shift_array << (offset.d_offset + keyholder.d_key)
  end

  def shift_message(message, operator)
    bang_shift_array = @shift_array
    ciper_message = message.chars.reduce([]) do |acc, message_char|
      if !(@alphabet.include?(message_char))
        acc << message_char
      else
        acc << @alphabet[((@alphabet.index(message_char).send(operator, bang_shift_array.first)) % 27)]
        bang_shift_array.rotate!
      end
      acc
    end
    ciper_message.join
  end
end
