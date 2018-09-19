require("minitest/autorun")
require("minitest/rg")
require_relative("../drink.rb")

class TestDrink < MiniTest::Test

  def setup()
    @drink1 = Drink.new("Vodka", 5.0, 3.10)

  end

  def test_return_name()
    assert_equal("Vodka", @drink1.name())
  end

  def test_alc_level()
    assert_equal(5.0, @drink1.alc_level())
  end

  def test_price()
    assert_equal(3.10, @drink1.price())
  end



end
