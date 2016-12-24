#this displays all the pokemons in the database
get '/pokemon' do
  @pokemons = Pokemon.all
  erb :"pokemon/index"
end

#this displays the form to create a new pokemon
get '/pokemon/new' do
  erb :"pokemon/new"
end

#this displays the specific pokemon
get '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemon/show"
end

get '/pokemon/:id/edit' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemon/edit"
end

post '/pokemon' do
  newPokemon = Pokemon.new(params[:pokemonInfo])

  if newPokemon.save
    redirect '/pokemon'
  else
    redirect '/pokemon/new'
  end
end

put '/pokemon/:id' do
  pokemon = Pokemon.find(params[:id])
  pokemon.update({name: params[:name], affinity: params[:affinity]})

  if pokemon.save
    redirect "/pokemon/#{params[:id]}"
  else
    redirect "/pokemon/#{params[:id]}/edit"
  end
end

delete '/pokemon/:id' do
  pokemon = Pokemon.find(params[:id])
  pokemon.delete

  redirect '/pokemon'
end

