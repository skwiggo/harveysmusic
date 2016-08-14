require('minitest/autorun')
require_relative('../models/stock')

class TestArtist < MiniTest::Test

  def setup
    options = {
      'album_id' => 1,
      'stock_level' => 10,
      'stock_health' => "Medium"
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


end