require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions

  get '/chitter' do
    erb :index
  end

  get '/chitter/view' do
    @peep = Peep.all.reverse
    erb :view
  end

  post '/chitter' do
    Peep.create(user_id: params[:user_id], peep: params[:peep])
    session[:user_id] = params[:user_id]
    redirect '/chitter'
  end

  get '/chitter/post' do 
    erb :post
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
