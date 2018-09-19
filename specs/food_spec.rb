require("minitest/autorun")
require("minitest/rg")
require_relative("../food.rb")

class TestFood < MiniTest::Test

  def setup()
    @food1 = Food.new("Burger", 5.0, 8.95)
  end

  def test_return_name()
    assert_equal("Burger", @food1.name())
  end

  def test_rejuv_level()
    assert_equal(5.0, @food1.rejuv_level())
  end

  def test_price()
    assert_equal(8.95, @food1.price())
  end



end
