class ChitterManager < Sinatra::Base
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
end
