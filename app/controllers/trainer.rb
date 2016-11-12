#shows a list of all the trainers
get '/trainer' do
  @trainers = Trainer.all
  erb :'trainer/index'
end

#shows the page to create a new trainer
get '/trainer/new' do
  erb :'trainer/new'
end

#shows one specific trainer
get '/trainer/:id' do
  trainer_id = params[:id]
  @trainer = Trainer.find(trainer_id)
  erb :'trainer/show'
end


#show the page to edit trainer information
get '/trainer/:id/edit' do
  @trainer = Trainer.find(params[:id])
  erb :'trainer/edit'
end

#has all the code to update specific trainer
put '/trainer/:id' do
  @trainer = Trainer.find(params[:id])
  @trainer.assign_attributes(params[:trainer])

  if @trainer.save
    redirect "/trainer/#{params[:id]}"
  else
    erb :'trainer/edit'
  end
end

#has all the code to create a new trainer in database
post '/trainer' do
  trainer = Trainer.new({name: params[:name], age: params[:age], gender: params[:gender]})

  if trainer.save
    redirect '/trainer'
  else
    erb :'trainer/new'
  end
end

#has code to delete specific trainer from database
delete '/trainer/:id' do
  trainer = Trainer.find(params[:id])
  trainer.destroy

  redirect '/trainer'
end