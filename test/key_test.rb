require_relative './test_helper'
require_relative './../lib/key'
require 'pry'

class KeyTest < Minitest::Test
  def setup
    @key = Key.new
  end

  def test_it_has_attributes
    @key.expects(:rand_num_string).returns('12345')
    assert_equal '12345', @key.rand_num_string
  end
end
