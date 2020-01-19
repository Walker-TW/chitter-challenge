require 'sinatra/base'
require './lib/peep'
require './lib/user'
# If i create a user class add this in

class Chitter < Sinatra::Base

  enable :sessions
  # enable :method_override
  # enable this if put/delete statements are needed
  # Which I think i dont need

  get '/chitter' do
    erb :index
  end

  get '/chitter/signup' do
    erb :signup
  end

  post '/chitter/congratulations' do
    erb :congratulations
  end


  run! if app_file == $0
end
