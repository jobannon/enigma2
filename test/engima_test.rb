require_relative './test_helper'
require_relative './../lib/enigma'
require 'pry'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Engima.new
  end

  def test_it_exists
    assert_instance_of Engima, @enigma
  end

  def test_encrypt
    skip
    expected ={
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      }
    #test with 3 args
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")

    #test with todays date
    expectedtoday = {
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

  def test_get_rand
    # rand_num1 = mock("12345")
    @enigma.expects(:get_rand).returns('12345')
    binding.pry
    assert_equal ('12345'), @enigma.get_rand
  end

  def test_get_keys
    skip
    @enigma.expects(:get_rand).returns('12345')
    @enigma.get_keys
  end

  def test_shift
    
  end

end
