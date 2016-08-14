require('minitest/autorun')
require_relative('../models/artist')

class TestArtist < MiniTest::Test

  def setup
    options = {
      'name' => 'The Smiths',
      'genre' => 'Indie Rock'
    }
    @artist = Artist.new(options)
  end

  def test_name()
    assert_equal("The Smiths", @artist.name())
  end

  def test_genre()
    assert_equal("Indie Rock", @artist.genre())
  end

end