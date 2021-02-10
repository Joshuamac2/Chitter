class ChitterManager < Sinatra::Base
  get '/tweet/:id/comments/new' do
    @tweet_id = params[:id]
    erb :'comments/new'
  end

  post '/tweet/:id/comments' do
    Comment.create(tweet_id: params[:id], text: params[:comment])
    redirect '/tweet'
  end
end
