#this displays all the pokemons in the database
get '/pokemon' do
  erb :"pokemon/index"
end

#this displays the specific pokemon
get '/pokemon/:id' do
  @asdf = params[:id]
  erb :"pokemon/show"
end