require("minitest/autorun")
require("minitest/rg")
require_relative("../pub.rb")
require_relative("../drink.rb")
require_relative("../customer.rb")
require_relative("../food.rb")

class TestPub < MiniTest::Test

  def setup()
    @customer1 = Customer.new("John", 25, 100)
    # John meets all requirements
    @customer2 = Customer.new("Brenda", 17, 20)
    # Brenda: under-age, sober, has money
    @customer3 = Customer.new("Alex", 31, 45, 30)
    # Alex: of age, has money but too drunk
    @customer4 = Customer.new("Pete", 43, 2)
    # Alex: of age, sober but not enough money
    @drink1 = Drink.new("Rum", 7, 3.70)
    @drink2 = Drink.new("Whisky", 11, 3.90)

    @food1 = Food.new("Burger", 5, 8.95)

    @pub1 = Pub.new("Hanging Bat", 1000)
  end

  def test_has_name()
    assert_equal("Hanging Bat", @pub1.name())
  end

  def test_has_till()
    assert_equal(1000, @pub1.till())
  end

  def test_starts_with_no_drinks()
    assert_equal([], @pub1.drinks())
  end

  def test_can_stock_up__drink()
    @pub1.stock_up(@drink1, @drink2)
    assert_equal([@drink1, @drink2],@pub1.drinks())
  end

  def test_can_stock_up__food()
    @pub1.stock_up(@food1)
    assert_equal([@food1],@pub1.food())
  end

  #check age
  def test_legal_age__true()
    assert(@pub1.legal_age?(@customer1))
  end

  def test_legal_age__false()
    assert_equal(false, @pub1.legal_age?(@customer2))
  end

  #check drunkenness
  def test_sober_enough__true()
    assert(@pub1.sober_enough?(@customer1))
  end

  def test_sober_enough__false()
    assert(!@pub1.sober_enough?(@customer3))
  end

  def test_can_afford__true()
    assert(@pub1.can_afford?(@customer1, @drink1))
  end

  def test_can_afford__false()
    assert_equal(false, @pub1.can_afford?(@customer4, @drink1))
  end

  # test money trade
    # wallet less price
    # till plus price
  def test_money_trade
    @pub1.money_trade(@customer1, @drink1)
    assert_equal(96.30, @customer1.wallet)
    assert_equal(1003.70, @pub1.till)
  end

  # test change in drunkenness
    # drunkennes up by alc_level
  def test_increase_drunkenness
    @pub1.increase_drunkenness(@customer1, @drink1)
    assert_equal(7, @customer1.drunkenness())
  end


  # test drink served
    # multiple asserts, one for each customer
  def test_serve_drink__success()
    @pub1.serve_drink(@customer1, @drink1)
    assert_equal(1003.70, @pub1.till)
  end

  def test_serve_drink__too_young()
    @pub1.serve_drink(@customer2, @drink1)
    assert_equal(1000, @pub1.till)
  end

  def test_serve_drink__too_drunk()
    @pub1.serve_drink(@customer3, @drink1)
    assert_equal(1000, @pub1.till)
  end

  def test_serve_drink__not_enough_money()
    @pub1.serve_drink(@customer4, @drink1)
    assert_equal(1000, @pub1.till)
  end

end
