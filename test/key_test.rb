require_relative './test_helper'
require_relative './../lib/key'
require 'pry'

class KeyTest < Minitest::Test
  def setup
    @key = Key.new(12345)
  end

  def test_it_has_attributes
    expected = 1 #not sure why cant do integer.new here
    assert_instance_of Integer, @key.a_key
    assert_equal expected.class, @key.a_key.class
    assert_equal expected.class, @key.b_key.class
    assert_equal expected.class, @key.c_key.class
    assert_equal expected.class, @key.d_key.class

    @key.expects(:rand_num_string).returns('12345')
    assert_equal '12345', @key.rand_num_string
  end

  def test_create_key
    @key.create_key
    assert_equal 12, @key.a_key
    assert_equal 23, @key.b_key
    assert_equal 34, @key.c_key
    assert_equal 45, @key.d_key
  end

  def test_it_generates_a_random_number
    test_key = Key.new
    test_key.create_num_string
    assert_equal 5, test_key.rand_num_string.length
    assert_instance_of String, test_key.rand_num_string
  end
end
