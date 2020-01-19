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
    User.create(email: params[:email], username: params[:username], realname: params[:realname], passwrd: params[:passwrd])
    session[:username] = params[:username]
    redirect '/chitter/congratulations'
  end

  get '/chitter/congratulations' do
    erb :congratulations
  end

  run! if app_file == $0
end
