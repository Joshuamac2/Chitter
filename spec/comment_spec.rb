require 'database_helpers'
require 'comment'
require 'chitter'

describe Comment do
  describe '.create' do
    it 'adds a comment to a existing tweet' do
      chitter = Chitter.create(url: "My first tweet")
      comment = Comment.create(text: 'Test comment', tweet_id: chitter.id)

      persisted_data = persisted_data(table: 'comments', id: comment.id )

      expect(comment).to be_a Comment
      expect(comment.id).to eq persisted_data.first['id']
      expect(comment.text).to eq 'Test comment'
      expect(comment.tweet_id).to eq chitter.id
    end
  end

  describe '.where' do
    it 'aquires comments from the databse' do
      chitter = Chitter.create(url: "My first tweet")
      Comment.create(text: 'Test comment', tweet_id: chitter.id)
      Comment.create(text: 'Second test comment', tweet_id: chitter.id)

      comments = Comment.where(tweet_id: chitter.id)
      comment = comments.first
      persisted_data = persisted_data(table: 'comments', id: comment.id)

      expect(comments.length).to eq 2
      expect(comment.id).to eq persisted_data.first['id']
      expect(comment.text).to eq 'Test comment'
      expect(comment.tweet_id).to eq chitter.id
    end
  end
end
