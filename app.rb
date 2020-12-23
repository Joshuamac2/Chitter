require 'sinatra/base'
require_relative './lib/chitter'

class ChitterManager < Sinatra::Base

  get '/' do
    'Welcome to Chitter!'
  end

  get '/tweet' do
    @chitter = Chitter.all
    erb :index
  end

  run! if app_file == $0
end
