require('pry-byebug')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')
require_relative('../models/stock.rb')

artist1 = Artist.new({ 'name' => 'The Smiths', 'genre' => 'Indie Rock'})
artist2 = Artist.new({ 'name' => 'The Replacements', 'genre' => 'Indie Rock'})
artist3 = Artist.new({ 'name' => 'The Jesus and Mary Chain', 'genre' => 'Shoegaze'})
artist4 = Artist.new({ 'name' => 'Gorilla Biscuits', 'genre' => 'Hardcore'})
artist5 = Artist.new({ 'name' => 'Orchid', 'genre' => 'Post-Hardcore'})
artist6 = Artist.new({ 'name' => 'Burial', 'genre' => 'Electronica/IDM'})
artist7 = Artist.new({ 'name' => 'The Grateful Dead', 'genre' => 'Prog/Psychedelia'})
artist8 = Artist.new({ 'name' => 'Squarepusher', 'genre' => 'Electronica/IDM'})
artist9 = Artist.new({ 'name' => 'Converge', 'genre' => 'Hardcore'})
artist10 = Artist.new({ 'name' => 'Orange Juice', 'genre' => 'Indie Rock'})

artist1.save
artist2.save
artist3.save
artist4.save
artist5.save
artist6.save
artist7.save
artist8.save
artist9.save
artist10.save

album1 = Album.new({ 'name' => 'Strangeways, Here We Come', 'artist_id' => artist1.id})
album2 = Album.new({ 'name' => 'Tim', 'artist_id' => artist2.id})
album3 = Album.new({ 'name' => 'Darklands', 'artist_id' => artist3.id})
album4 = Album.new({ 'name' => 'Start Today', 'artist_id' => artist4.id})
album5 = Album.new({ 'name' => 'Dance Tonight! Revolution Tomorrow!', 'artist_id' => artist5.id})
album6 = Album.new({ 'name' => 'Untrue', 'artist_id' => artist6.id})
album7 = Album.new({ 'name' => 'Anthem of the Sun', 'artist_id' => artist7.id})
album8 = Album.new({ 'name' => 'Go Plastic', 'artist_id' => artist8.id})
album9 = Album.new({ 'name' => 'All We Love We Leave Behind', 'artist_id' => artist9.id})
album10 = Album.new({ 'name' => 'Rip It Up', 'artist_id' => artist10.id})

album1.save
album2.save
album3.save
album4.save
album5.save
album6.save
album7.save
album8.save
album9.save
album10.save

stock1 = Stock.new({'album_id' => album1.id, 'stock_level' => 5, 'buy_price' => 5, 'sell_price' => 7})
stock2 = Stock.new({'album_id' => album2.id, 'stock_level' => 5, 'buy_price' => 5, 'sell_price' => 7})
stock3 = Stock.new({'album_id' => album3.id, 'stock_level' => 5, 'buy_price' => 5, 'sell_price' => 7})
stock4 = Stock.new({'album_id' => album4.id, 'stock_level' => 5, 'buy_price' => 5, 'sell_price' => 7})
stock5 = Stock.new({'album_id' => album5.id, 'stock_level' => 5, 'buy_price' => 5, 'sell_price' => 7})
stock6 = Stock.new({'album_id' => album6.id, 'stock_level' => 5, 'buy_price' => 5, 'sell_price' => 7})
stock7 = Stock.new({'album_id' => album7.id, 'stock_level' => 5, 'buy_price' => 5, 'sell_price' => 7})
stock8 = Stock.new({'album_id' => album8.id, 'stock_level' => 5, 'buy_price' => 5, 'sell_price' => 7})
stock9 = Stock.new({'album_id' => album9.id, 'stock_level' => 5, 'buy_price' => 5, 'sell_price' => 7})
stock10 = Stock.new({'album_id' => album10.id, 'stock_level' => 5, 'buy_price' => 5, 'sell_price' => 7})

stock1.save
stock2.save
stock3.save
stock4.save
stock5.save
stock6.save
stock7.save
stock8.save
stock9.save
stock10.save


binding.pry
nil