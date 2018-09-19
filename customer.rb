class Customer

  attr_reader :name, :age
  attr_accessor :wallet, :drunkenness

  def initialize(name, age, wallet, drunkenness=0)
    @name = name
    @age = age
    @wallet = wallet
    @drunkenness = drunkenness
  end

  def can_buy?(product)
    @wallet >= product.price
  end


end
