class Food

  attr_reader :name, :rejuv_level
  attr_accessor :price

  def initialize(name, rejuv_level, price)
    @name = name
    @price = price
    @rejuv_level = rejuv_level.to_f
  end



end
