require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/artist')
require_relative('./models/album')
require_relative('./models/stock')


#UPDATE
post '/artists/:id' do
  Artist.update(params)
  redirect(to( "/artists/#{params[:id]}"))
end

#INDEX
get '/artists' do
  @artists = Artist.all()
  erb (:'artists/index')
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
  redirect(to( "/artists/#{params[:id]}"))
end

#INDEX
get '/albums' do
  @albums = Album.all()
  erb(:'albums/index')
end

#NEW - HTML FORM
get '/albums/new' do 
  @artists = Artist.all()
  erb(:'albums/new')
end

#EDIT - HTML
get '/albums/:id/edit' do
  @albums = Album.find(params[:id])
  erb(:'albums/edit')
end

#SHOW
get '/albums/:id' do
  @albums = Album.find(params[:id])
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