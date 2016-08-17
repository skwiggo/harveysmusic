require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/artist')
require_relative('./models/album')
require_relative('./models/stock')
require_relative( './controllers/albums_controller.rb' )
require_relative( './controllers/artists_controller.rb' )
require_relative( './controllers/stocks_controller.rb' )

#HOME
get '/' do
  erb(:home)
end

# MAIN INDEX(INVENTORY)
get '/index' do
  @stocks = Stock.all()
  erb(:index)
end

# ADD/DISPLAY RECORDS
get '/add' do
  erb(:add_records)
end

# ADD/DISPLAY RECORDS
get '/display' do
  erb(:display_records)
end





