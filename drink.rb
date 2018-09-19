class Drink

  attr_reader :name, :alc_level
  attr_accessor :price

  def initialize(name, alc_level, price)
    @name = name
    @price = price
    @alc_level = alc_level
  end



end
