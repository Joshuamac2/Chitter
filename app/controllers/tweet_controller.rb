class ChitterManager < Sinatra::Base
  get '/tweet' do
    @user = User.find(id: session[:user_id])
    @chitter = Chitter.all
    erb :'chitter/index'
  end

  get '/tweet/new' do
    erb :"tweets/new"
  end

  post '/tweet' do
    Chitter.create(url: params[:url], user_id: session[:user_id])
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
end
