require_relative './test_helper'
require_relative './../lib/enigma'
require_relative './../lib/key'
require_relative './../lib/offset'
require 'date'
require 'pry'

class EnigmaTest < Minitest::Test
  def setup
    @key_pass = Key.new
    @offset_pass = Offset.new
    @enigma = Enigma.new #(,key and offset)
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_encrypt
    expected ={
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      }
    ##test with 3 args
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
############
    time = mock('Time')
    time.stubs(:strftime).returns'091119'
    expected2 ={
      encryption: "keder ohulw",
      key: "02715",
      date: Time.now.strftime("%d%m%Y")
      }
      binding.pry
    assert_equal Time.now.strftime("%d%m%y"), @enigma.encrypt("hello world", "02715")[:date]

  end

  def test_decrypt
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
    ## todays date
    ##
  end

  def test_shift_array
    expected = [3, 27, 73, 20]
    date = "040895"
    @offset_pass.create_offsets(date)
    this_key = Key.new("02715")
    #*** this test needs revision
    assert_equal expected, @enigma.create_shift_array(@offset_pass, this_key)
  end

  def test_shift_message_plus
    date = "040895"
    this_key = Key.new("02715")
    @offset_pass.create_offsets(date)
    @enigma.create_shift_array(@offset_pass, this_key)
    assert_equal "keder ohulw!", @enigma.shift_message("hello world!", "+")
  end

  def test_shift_message_minus
    date = "040895"
    this_key = Key.new("02715")
    @offset_pass.create_offsets(date)
    @enigma.create_shift_array(@offset_pass, this_key)
    # binding.pry
    assert_equal "hello world!", @enigma.shift_message("keder ohulw!", "-")
  end
end
