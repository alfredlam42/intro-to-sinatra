# this should display all the pokemons in our database
get '/pokemon' do
  @pokemons = Pokemon.all()
  erb :'/pokemon/index'
end

# this is the form to create a new pokemon
get '/pokemon/new' do
  erb :'/pokemon/new'
end

# this creates the pokemon in the databse
post '/pokemon' do
  Pokemon.create({name: params[:name], affinity: params[:affinity]})

  redirect '/pokemon'
end

# this should show one specific pokemon
get '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :'/pokemon/show'
end

# this is the form to edit the selected pokemon
get '/pokemon/:id/edit' do
  @pokemon = Pokemon.find(params[:id])
  erb :'/pokemon/edit'
end

put '/pokemon/:id' do
  pokemon = Pokemon.find(params[:id])
  pokemon.update(params[:pokemon])

  redirect "/pokemon/#{params[:id]}"
end

delete '/pokemon/:id' do
  pokemon = Pokemon.find(params[:id])
  pokemon.destroy()

  redirect '/pokemon'
end