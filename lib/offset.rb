require 'date'
require 'time'
require 'pry'

class Offset
  attr_reader :a_offset, :b_offset, :c_offset, :d_offset

  def initialize(date = "emptyfornow", key = "emptyfornow")
  end

  def create_offsets(optional_date = Time.now.strftime("%d%m%Y") )
    # date = Time.now.strftime("%d%m%Y")
    #this creates based on passed in date or todays
    squared_date = square_date(optional_date).to_s
    trimmed_squared_date = get_last_four(squared_date)
    @a_offset = trimmed_squared_date[0].to_i
    @b_offset = trimmed_squared_date[1].to_i
    @c_offset = trimmed_squared_date[2].to_i
    @d_offset = trimmed_squared_date[3].to_i
  end

  def square_date(date)
    date.to_i * date.to_i
  end

  def get_last_four(squared_date)
    squared_date[squared_date.length - 4...squared_date.length]
  end

end
