require 'tag'
require 'chitter'
require 'database_helpers'
require 'tweet_tag'

describe Tag do

  let(:tweet_class) { double(:tweet_class) }

  describe '.create' do
    it 'creates a new Tag' do
      tag = Tag.create(content: 'test tag')

      persisted_data = persisted_data(id: tag.id, table: 'tags')

      expect(tag).to be_a Tag
      expect(tag.id).to eq persisted_data.first['id']
      expect(tag.content).to eq 'test tag'
    end

    it 'returns the existing tag' do
      tag1 = Tag.create(content: 'test tag')
      tag2 = Tag.create(content: 'test tag')

      expect(tag2.id).to eq tag1.id
    end
  end

  describe '.where' do
    it 'finds the tags linked to the tweet' do
      chitter = Chitter.create(url: "My first tweet")
      tag1 = Tag.create(content: 'test tag 1')
      tag2 = Tag.create(content: 'test tag 2')
      TweetTag.create(tweet_id: chitter.id, tag_id: tag1.id)
      TweetTag.create(tweet_id: chitter.id, tag_id: tag2.id)

      tags = Tag.where(tweet_id: chitter.id)
      tag = tags.first

      expect(tags.length).to eq 2
      expect(tag).to be_a Tag
      expect(tag.id).to eq tag1.id
      expect(tag.content).to eq tag1.content
    end
  end
end
