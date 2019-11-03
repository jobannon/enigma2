class Key
  attr_reader :rand_num_string
  def initialize
      5.times do
        rand_num = rand(5).to_s
        rand_num_string = rand_num
      end
      rand_num_string
  end




end
