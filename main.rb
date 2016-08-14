require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/artist')
require_relative('./models/album')


#UPDATE
post '/artists/:id' do
  Artist.update(params)
  redirect(to( "/artists/#{params[:id]}"))
end

#INDEX
get '/artists' do
  @artists = Artist.all()
  erb (:artist_index)
end

#NEW - HTML FORM
get '/artists/new' do 
  erb(:new_artist)
end

#EDIT - HTML
get '/artists/:id/edit' do
  @artists = Artist.find(params[:id])
  erb(:edit_artist)
end

#SHOW
get '/artists/:id' do
  @artists = Artist.find(params[:id])
  erb(:show_artist)
end

#CREATE
post '/artists' do 
  @artists = Artist.new(params)
  @artists.save() 
  erb(:create_artist)
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
  erb(:album_index)
end

#NEW - HTML FORM
get '/albums/new' do 
  @artists = Artist.all()
  erb(:new_album)
end

#EDIT - HTML
get '/albums/:id/edit' do
  @albums = Album.find(params[:id])
  erb(:edit_album)
end

#SHOW
get '/albums/:id' do
  @albums = Album.find(params[:id])
  erb(:show_album)
end

#CREATE
post '/albums' do 
  @albums = Album.new(params)
  @albums.save() 
  erb(:create_album)
end

#DESTROY
post '/albums/:id/delete' do
  Album.destroy(params[:id])
  redirect(to('/albums'))
end