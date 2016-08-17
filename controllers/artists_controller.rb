#UPDATE
post '/artists/:id' do
  Artist.update(params)
  redirect(to( "/artists/#{params[:id]}"))
end

#INDEX
get '/artists' do
  @artists = Artist.all()
  @albums = Album.all()
  erb(:'artists/index')
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
  result = @artists.save()
  erb(:'artists/create')
end

#DESTROY
post '/artists/:id/delete' do
  Artist.destroy(params[:id])
  redirect(to('/artists'))
end