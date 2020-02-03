require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new("#{params["gossip_author"]}", "#{params["gossip_content"]}").save
    redirect '/'
  end

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end 

  get '/gossips/:id/' do
  "Voici le numéro du potin que tu veux : #{params[:id]} !"
  end
  
  get '/gossips/:id' do
    erb :id, locals: {nb_id: Gossip.find(params[:id.to_i])}
	end

  get '/show/:id/' do
   		erb :show, locals: {id: params[:id], show: Gossip.find(params[:id].to_i) }
	 end

end
