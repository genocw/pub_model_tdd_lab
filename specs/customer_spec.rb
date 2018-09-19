require("minitest/autorun")
require("minitest/rg")
require_relative("../customer.rb")
require_relative("../drink.rb")

class TestCustomer < MiniTest::Test

  def setup()
    @customer1 = Customer.new("John", 25, 100)
    @customer2 = Customer.new("Genna", 17, 2, 3)
    @drink1 = Drink.new("Monkey Shoulder", 12.0, 3.80)
  end

  # test name
  def test_has_name()
    assert_equal("John", @customer1.name())
  end

  # test age
  def test_has_age()
    assert_equal(25, @customer1.age)
  end

  # test wallet
  def test_has_wallet()
    assert_equal(100, @customer1.wallet)
  end

  # test drunkenness
  def test_drunkenness__default
    assert_equal(0, @customer1.drunkenness)
  end

  def test_drunkenness__set()
    assert_equal(3, @customer2.drunkenness)
  end


  def test_can_buy__enough_money()
    assert(@customer1.can_buy?(@drink1))
  end

  def test_can_buy__not_enough_money()
    assert_equal(false, @customer2.can_buy?(@drink1))
  end





end
