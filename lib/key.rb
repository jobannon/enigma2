class Key
  attr_reader :rand_num_string, :a_key, :b_key, :c_key, :d_key
  def initialize(given_key = 0)
    @a_key = ""
    @b_key = ""
    @c_key = ""
    @d_key = ""

    if given_key == 0
      @rand_num_string = create_num_string
    else
      @rand_num_string = given_key.to_s
    end
    create_key
  end

  def create_num_string
    rand_num_array = []
    5.times do
      rand_num_array << rand(5).to_s
    end
    rand_num_array.join
  end

  def create_key
    @a_key = @rand_num_string[0..1].to_i
    @b_key = @rand_num_string[1..2].to_i
    @c_key = @rand_num_string[2..3].to_i
    @d_key = @rand_num_string[3..4].to_i
  end

end
