require 'sinatra/base'
require_relative './lib/chitter'

class ChitterManager < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    'Welcome to Chitter!'
  end

  get '/tweet' do
    @chitter = Chitter.all
    erb :index
  end

  get '/tweet/new' do
    erb :"tweets/new"
  end

  post '/tweet' do
    Chitter.create(url: params[:url])
    redirect '/tweet'
  end

  delete '/tweet/:id' do
    Chitter.delete(id: params[:id])
    redirect '/tweet'
  end

  get '/tweet/:id/edit' do
    @chitter = Chitter.find(id: params[:id])
    erb :'tweets/edit'
  end

  patch '/tweet/:id' do
    Chitter.update(id: params[:id], url: params[:url])
    redirect('/tweet')
  end

  get '/bookmarks/:id/edit' do
    @chitter = Chitter.find(id: params[:id])
    erb :'tweets/edit'
  end

  run! if app_file == $0
end
