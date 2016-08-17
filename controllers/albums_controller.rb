#UPDATE
post '/albums/:id' do
  Album.update(params)
  redirect(to( '/artists/#{params[:id]}'))
end

#INDEX
get '/albums' do
  @albums = Album.all()
  @artists = Artist.all()
  erb(:'albums/index')
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