class ChitterManager < Sinatra::Base
  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password], username: params[:username])
    if user
      session[:user_id] = user.id
      redirect('/tweet')
    else
      flash[:notice] = 'Incorrect email or password'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'Successfully signed out'
    redirect('/tweet')
  end
end
