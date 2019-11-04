require_relative './test_helper'
require_relative './../lib/enigma'
require 'date'


require 'pry'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Engima.new #(,key and offset)
  end

  def test_it_exists
    assert_instance_of Engima, @enigma
  end

  def test_encrypt
    expected ={
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      }
    #test with 3 args
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")

    #test with todays date
    expectedtoday = {
      encryption: "keder ohulw",
      key: "02715",
      date: Time.now.strftime("%d%m%Y")
      }
    assert_equal expectedtoday, @enigma.encrypt("hello world", "02715")

    #test with random key and todays date
    expected_today_and_random = {

    }
    assert_equal expected_today_and_random, @enigma.encrypt("hello world")
  end

  def test_decrypt
    skip
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_create_ciper
    assert_equal "keder ohulw", @enigma.create_ciper("hello world")
  end

  def test_shift_array
    expected = [3, 27, 73, 20]
    date = "040895"
    key = Key.new
    offset = Offset.new
    offset.create_offsets(date)
    #*** this test needs revision
    assert_equal expected, @enigma.create_shift_array(offset, key)
  end

  def test_shift_message
    date = "040895"
    key = Key.new
    offset = Offset.new
    offset.create_offsets(date)
    @enigma.create_shift_array(offset, key)

    assert_equal "keder ohulw", @enigma.shift_message("hello world", @enigma.shift_array)

  end
end
