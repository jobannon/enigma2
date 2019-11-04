require_relative './test_helper'
require_relative './../lib/key'
require 'pry'

class KeyTest < Minitest::Test
  def setup
    @key = Key.new
  end

  def test_it_has_attributes
    expected = 1 #not sure why cant do integer.new
    assert_equal expected.class, @key.a_key.class
    assert_equal expected.class, @key.b_key.class
    assert_equal expected.class, @key.c_key.class
    assert_equal expected.class, @key.d_key.class

    @key.expects(:rand_num_string).returns('12345')
    assert_equal '12345', @key.rand_num_string
  end
end
