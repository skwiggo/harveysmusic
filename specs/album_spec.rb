require('minitest/autorun')
require_relative('../models/album')

class TestAlbum < MiniTest::Test

  def setup
    options = {
      'name' => 'The Queen is Dead',
      'artist_id' => 1,
    }
    @album = Album.new(options)
  end

  def test_name()
    assert_equal("The Queen is Dead", @album.name())
  end

  def test_artist_id()
    assert_equal(1, @album.artist_id())
  end

end