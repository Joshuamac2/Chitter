require_relative './database_connection'

class Comment

  attr_reader :id, :text, :tweet_id

  def initialize(id:, text:, tweet_id:)
    @id = id
    @text = text
    @tweet_id = tweet_id
  end

  def self.create(tweet_id:, text:)
    result = DatabaseConnection.query("INSERT INTO comments (tweet_id, text) VALUES ('#{tweet_id}','#{text}') RETURNING id, text, tweet_id;")
    Comment.new(
      id: result[0]['id'],
      text: result[0]['text'],
      tweet_id: result[0]['tweet_id']
    )
  end

  def self.where(tweet_id:)
    result = DatabaseConnection.query("SELECT * FROM comments WHERE tweet_id = #{tweet_id};")
    result.map do |comment|
      Comment.new(
        id: comment['id'],
        text: comment['text'],
        tweet_id: comment['tweet_id']
      )
    end
  end
end
