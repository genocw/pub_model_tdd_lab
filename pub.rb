class Pub

  attr_reader :name
  attr_accessor :till, :drinks, :food

  def initialize(name, till)
    @name = name
    @till = till.to_f
    @drinks = []
    @food = []
  end

  def stock_up(*new_stock)
    for product in new_stock
      if product.class == Drink
        @drinks.push(product)
      elsif
        product.class == Food
        @food.push(product)
      end
    end
  end

  def legal_age?(customer)
    customer.age >= 18
  end

  def sober_enough?(customer)
    customer.drunkenness < 25
  end

  def can_afford?(customer, drink)
    customer.can_buy?(drink)
  end

  # money trade
  #change customer wallet to float
  def money_trade(customer, drink)
    customer.wallet = customer.wallet.to_f - drink.price
    @till = @till.to_f + drink.price
  end

  # drunkenness
  def increase_drunkenness(customer, drink)
    customer.drunkenness = customer.drunkenness.to_f + drink.alc_level
  end

  # serve drink method tying all above together
  def serve_drink(customer, drink)
    a = legal_age?(customer)
    b = sober_enough?(customer)
    c = can_afford?(customer, drink)
    if a && (b && c)
      money_trade(customer, drink)
      increase_drunkenness(customer, drink)
      puts "There you go, bud."
    else
      puts "Not today, pal..."
    end
  end

end
