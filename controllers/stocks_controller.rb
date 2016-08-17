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