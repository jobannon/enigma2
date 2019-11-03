require_relative './test_helper'
require_relative './../lib/offset'
require 'pry'

class ClassTest < Minitest::Test
  def setup
    @offset = Offset.new
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_it_has_attributes
  end

  def test_it_can_create_offsets
    optional_dt = '040895'
    @offset.create_offsets(optional_dt)
    assert_equal 1, @offset.a_digit
    assert_equal 0, @offset.b_digit
    assert_equal 2, @offset.c_digit
    assert_equal 5, @offset.d_digit

  end

  def test_square_date
    assert_equal 1672401025, @offset.square_date('040895')
  end

  
end
