# Displays all the pokemons
get '/pokemon' do
  @pokemons = Pokemon.all
  erb :'/pokemon/index'
end

# Displays the form to create a new Pokemon
get '/pokemon/new' do
  erb :'/pokemon/new'
end

# Code goes here to create a Pokemon in the database
post '/pokemon' do
  Pokemon.create({name: params[:pokemonName], affinity: params[:pokemonAffinity]})
  redirect '/pokemon'
end

# Code goes to get specific pokemon and returns page with that information
get '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :'/pokemon/show'
end

# Displays the form to edit this specific Pokemon
get '/pokemon/:id/edit' do
  @pokemon = Pokemon.find(params[:id])
  erb :'/pokemon/edit'
end

# Code goes here to update the specific Pokemon in databse
put '/pokemon/:id' do
  pokemon = Pokemon.find(params[:id])
  pokemon.update(params[:pokemon])
  redirect "/pokemon/#{params[:id]}"
end

# Code goes here to delete Pokemon in database
delete '/pokemon/:id' do
  pokemon = Pokemon.find(params[:id])
  pokemon.delete
  redirect '/pokemon'
end