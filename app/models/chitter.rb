require_relative 'database_connection'
require_relative 'comment'
require_relative './tag'

class Chitter

  attr_reader :id, :url, :posted_time, :user_id

  def initialize(id:, url:, posted_time:, user_id:)
    @id = id
    @url = url
    @posted_time = posted_time
    @user_id = user_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM tweets")
    result.map do |tweet|
      Chitter.new(
        id: tweet['id'],
        url: tweet['url'],
        posted_time: tweet['posted_time'],
        user_id: tweet['user_id']
      )
    end
  end

  def self.create(url:, user_id:)
    result = DatabaseConnection.query("INSERT INTO tweets (url, posted_time, user_id) VALUES('#{url}', '#{post_time}', '#{user_id}') RETURNING id, url, posted_time, user_id")
    Chitter.new(
      id: result[0]['id'],
      url: result[0]['url'],
      posted_time: result[0]['posted_time'],
      user_id: result[0]['user_id']
    )
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM tweets WHERE id = #{id}")
  end

  def self.update(id:, url:)
    result = DatabaseConnection.query("UPDATE tweets SET url = '#{url}' WHERE id = #{id} RETURNING id, url;")
    Chitter.new(
      id: result[0]['id'],
      url: result[0]['url']
    )
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM tweets WHERE id = #{id}")
    Chitter.new(
      id: result[0]['id'],
      url: result[0]['url']
    )
  end

  def comments(comment_class = Comment)
    comment_class.where(tweet_id: id)
  end

  def tags(tag_class = Tag)
    tag_class.where(tweet_id: id)
  end

  def self.where(tag_id:)
    result = DatabaseConnection.query("SELECT id, url FROM tweet_tags INNER JOIN tweets ON tweets.id = tweet_tags.tweet_id WHERE tag_id = #{tag_id};")
    result.map do |tweet|
      Chitter.new(
        id: tweet['id'],
        url: tweet['url']
      )
    end
  end

  private
  
  def self.post_time
    Time.now.strftime("%k:%M")
  end
end
