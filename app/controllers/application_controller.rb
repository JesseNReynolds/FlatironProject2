require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "placeholder"
    use Rack::MethodOverride
  end

  get "/" do
    erb :welcome
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end
  
end
