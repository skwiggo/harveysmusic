require('pry-byebug')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')
require_relative('../models/stock.rb')

Artist.delete()
Album.delete()
Stock.delete()

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

book1.save
book2.save
book3.save
book4.save
book5.save


member1 = Member.new({ 'name' => 'Conan the Librarian', 'address' => 'Hyboria'})
member2 = Member.new({ 'name' => 'Val Gibson/Dryden', 'address' => 'Kanto region'})
member3 = Member.new({ 'name' => 'Antonio Eusebio De Abreu Goncalves', 'address' => 'Papa Tyno Authentic Italian Ristorante'})
member4 = Member.new({ 'name' => 'Jay Chetty', 'address' => 'TableTennisLand'})
member5 = Member.new({ 'name' => 'Zsolt Podoba-Szalai', 'address' => 'Nearest Chippie'})

member1.save
member2.save
member3.save
member4.save
member5.save


rental1 = Rental.new({'book_id' => book1.id, 'member_id' => member1.id})
rental2 = Rental.new({'book_id' => book2.id, 'member_id' => member1.id})
rental3 = Rental.new({'book_id' => book3.id, 'member_id' => member2.id})
rental4 = Rental.new({'book_id' => book4.id, 'member_id' => member1.id})
rental5 = Rental.new({'book_id' => book5.id, 'member_id' => member2.id})
rental6 = Rental.new({'book_id' => book3.id, 'member_id' => member3.id})
rental7 = Rental.new({'book_id' => book2.id, 'member_id' => member5.id})
rental8 = Rental.new({'book_id' => book4.id, 'member_id' => member5.id})

rental1.save
rental2.save
rental3.save
rental4.save
rental5.save
rental6.save
rental7.save
rental8.save

binding.pry
nil