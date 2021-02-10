require_relative 'database_connection'

 class TweetTag

   attr_reader :tweet_id, :tag_id

   def initialize(tweet_id:, tag_id:)
     @tweet_id = tweet_id
     @tag_id = tag_id
   end

   def self.create(tweet_id:, tag_id:)
     result = DatabaseConnection.query("INSERT INTO tweet_tags (tweet_id, tag_id) VALUES('#{tweet_id}', '#{tag_id}') RETURNING tweet_id, tag_id;")
     TweetTag.new(tweet_id: result[0]['tweet_id'], tag_id: result[0]['tag_id'])
   end

 end
