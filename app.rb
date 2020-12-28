require 'sinatra/base'
require_relative './lib/chitter'
require_relative '/Users/joshua/makers/chitter/spec/features/database_connection_spec.rb'
require_relative './lib/comment'

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

  get '/tweet/:id/comments/new' do
    @tweet_id = params[:id]
    erb :'comments/new'
  end

  post '/tweet/:id/comments' do
    Comment.create(text: params[:comment], tweet_id: params[:id])
    redirect '/tweet'
  end

  run! if app_file == $0
end
