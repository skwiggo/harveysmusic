require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/artist')
require_relative('./models/album')
require_relative('./models/stock')

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

#UPDATE
post '/artists/:id' do
  Artist.update(params)
  redirect(to( "/artists/#{params[:id]}"))
end

#NEW - HTML FORM
get '/artists/new' do 
  erb(:'artists/new')
end

#EDIT - HTML
get '/artists/:id/edit' do
  @artists = Artist.find(params[:id])
  erb(:'artists/edit')
end

#SHOW
get '/artists/:id' do
  @artists = Artist.find(params[:id])
  @albums = Album.all()
  erb(:'artists/show')
end

#CREATE
post '/artists' do 
  @artists = Artist.new(params) 
  @artists.save()
  erb(:'artists/create')
end

#DESTROY
post '/artists/:id/delete' do
  Artist.destroy(params[:id])
  redirect(to('/artists'))
end

#UPDATE
post '/albums/:id' do
  Album.update(params)
  redirect(to( '/artists/#{params[:id]}'))
end

#NEW 
get '/albums/new' do 
  @artists = Artist.all()
  erb(:'albums/new')
end

#EDIT 
get '/albums/:id/edit' do
  @albums = Album.find(params[:id])
  erb(:'albums/edit')
end

#SHOW
get '/albums/:id' do
  @albums = Album.find(params[:id])
  @artists = Artist.all()
  erb(:'albums/show')
end

#CREATE
post '/albums' do 
  @albums = Album.new(params)
  @albums.save() 
  erb(:'albums/create')
end

#DESTROY
post '/albums/:id/delete' do
  Album.destroy(params[:id])
  redirect(to('/albums'))
end

#UPDATE
post '/stocks/:id' do
  Stock.update(params)
  redirect(to( "/stocks/#{params[:id]}"))
end

#INDEX
get '/stocks' do
  @stocks = Stock.all()
  @albums = Album.all()
  erb(:'stocks/index')
end

#NEW 
get '/stocks/new' do 
  @albums = Album.all()
  erb(:'stocks/new')
end

#EDIT 
get '/stocks/:id/edit' do
  @stocks = Stock.find(params[:id])
  @albums = Album.all()
  erb(:'stocks/edit')
end

#SHOW
get '/stocks/:id' do
  @stocks = Stock.find(params[:id])
  @albums = Album.all()
  erb(:'stocks/show')
end

#CREATE
post '/stocks' do 
  @stocks = Stock.new(params)
  result = @stocks.save()
  erb(:'stocks/create')
end

#DESTROY
post '/stocks/:id/delete' do
  Stock.destroy(params[:id])
  redirect(to('/stocks'))
end






