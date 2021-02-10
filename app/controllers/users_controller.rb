class ChitterManager < Sinatra::Base
  get '/users' do
    erb :"users/new"
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'], username: params['username'])
    session[:user_id] = user.id
    redirect '/tweet'
  end
end
