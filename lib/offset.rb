require 'date'
require 'time'
require 'pry'

class Offset
  def initialize
  end

  def create_offsets(optional_date = Time.now.strftime("%d%m%Y") )
    # date = Time.now.strftime("%d%m%Y")
    squared_date = square_date(optional_date).to_s

    result = squared_date[squared_date.length - 4...squared_date.length]
    binding.pry
  end

  def square_date(date)
    date.to_i * date.to_i
  end
end
