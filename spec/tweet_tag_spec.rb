require 'tweet_tag'

 describe TweetTag do
   describe '.create' do
     it 'creates a link between a bookmark and a tag' do
       chitter = Chitter.create(url: 'My first tweet')
       tag = Tag.create(content: 'test tag')

       tweet_tag = TweetTag.create(tweet_id: chitter.id, tag_id: tag.id)

       expect(tweet_tag).to be_a TweetTag
       expect(tweet_tag.tag_id).to eq tag.id
       expect(tweet_tag.tweet_id).to eq chitter.id
     end
   end
 end
