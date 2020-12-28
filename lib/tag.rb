require_relative './database_connection'

 class Tag

   attr_reader :id, :content

   def initialize(id:, content:)
     @id = id
     @content = content
   end

   def self.create(content:)
     result = DatabaseConnection.query("INSERT INTO tags (content) VALUES('#{content}') RETURNING id, content;")
     Tag.new(id: result[0]['id'], content: result[0]['content'])
   end

   def self.where(tweet_id:)
     result = DatabaseConnection.query("SELECT id, content FROM tweet_tags INNER JOIN tags ON tags.id = tweet_tags.tag_id WHERE tweet_tags.tweet_id = '#{tweet_id}';")
     result.map do |tag|
       Tag.new(id: tag['id'], content: tag['content'])
     end
   end
 end