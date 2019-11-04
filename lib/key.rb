class Key
  attr_reader :rand_num_string, :a_key, :b_key, :c_key, :d_key
  def initialize
    @a_key = 0
    @b_key = 0
    @c_key = 0
    @d_key = 0

    create_num_string
    create_key
  end

  def create_num_string
    5.times do
      rand_num = rand(5).to_s
      @rand_num_string = rand_num
    end
    rand_num_string
  end

  def create_key
    @a_key = @rand_num_string[0].to_i
    @b_key = @rand_num_string[1].to_i
    @c_key = @rand_num_string[2].to_i
    @d_key = @rand_num_string[3].to_i
  end

end
