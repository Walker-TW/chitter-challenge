require 'sinatra/base'
require './lib/peep'
# If i create a user class add this in

class Chitter < Sinatra::Base

  enable :sessions
  # enable :method_override
  # enable this if put/delete statements are needed

  run! if app_file == $0
end
