require 'sinatra/base'
require_relative './lib/chitter'
require_relative '/Users/joshua/makers/chitter/spec/features/database_connection_spec.rb'
require_relative './lib/comment'
require_relative './lib/tag'
require_relative './lib/tweet_tag'
require_relative './lib/user'

class ChitterManager < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    'Welcome to Chitter!'
  end

  get '/tweet' do
    @user = User.find(id: session[:user_id])
    @chitter = Chitter.all
    erb :'chitter/index'
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
    Comment.create(tweet_id: params[:id], text: params[:comment])
    redirect '/tweet'
  end

  get '/tweet/:id/tags/new' do
     @tweet_id = params[:id]
     erb :'/tags/new'
   end

   post '/tweet/:id/tags' do
     tag = Tag.create(content: params[:tag])
     TweetTag.create(tweet_id: params[:id], tag_id: tag.id)
     redirect '/tweet'
   end

   get '/tags/:id/tweet' do
     @tag = Tag.find(id: params['id'])
     erb :'tags/index'
   end

   get '/users/new' do
     erb :"users/new"
   end

   post '/users' do
     user = User.create(email: params['email'], password: params['password'])
     session[:user_id] = user.id
     redirect '/tweet'
   end

   get '/sessions/new' do
     erb :"sessions/new"
   end

   post '/sessions' do
     user = User.authenticate(email: params[:email], password: params[:password])
     session[:user_id] = user.id
     redirect('/tweet')
   end

  run! if app_file == $0
end
