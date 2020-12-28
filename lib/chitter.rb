require 'pg'
require_relative 'database_connection'
require_relative 'comment'

class Chitter

  attr_reader :id, :url

  def initialize(id:, url:)
    @id = id
    @url = url
  end

  def self.all
    tweets = DatabaseConnection.query("SELECT * FROM tweets")
    tweets.map do |tweet|
      Chitter.new(
        url: tweet['url'],
        id: tweet['id']
      )
    end
  end

  def self.create(url:)
    result = DatabaseConnection.query("INSERT INTO tweets (url) VALUES('#{url}') RETURNING id, url;")

    Chitter.new(id: result[0]['id'], url: result[0]['url'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM tweets WHERE id = #{id}")
  end

  def self.update(id:, url:)
    result = DatabaseConnection.query("UPDATE tweets SET url = '#{url}' WHERE id = #{id} RETURNING id, url;")
    Chitter.new(id: result[0]['id'], url: result[0]['url'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM tweets WHERE id = #{id}")
    Chitter.new(id: result[0]['id'], url: result[0]['url'])
  end

  def comments(comment_class = Comment)
    comment_class.where(tweet_id: id)
  end
end
