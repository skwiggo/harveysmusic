require('minitest/autorun')
require_relative('../models/stock')

class TestArtist < MiniTest::Test

  def setup
    options = {
      'album_id' => 1,
      'stock_level' => 10,
      'stock_health' => "Medium",
      'buy_price' => 5,
      'sell_price' => 7
    }
    @stock = Stock.new(options)
  end

  def test_album_id()
    assert_equal(1, @stock.album_id())
  end

  def test_stock_level()
    assert_equal(10, @stock.stock_level())
  end

  def test_stock_health()
    assert_equal("Medium", @stock.stock_health())
  end

  def test_buy_price()
    assert_equal(5, @stock.buy_price())
  end

  def test_sell_price()
    assert_equal(7, @stock.sell_price())
  end
end