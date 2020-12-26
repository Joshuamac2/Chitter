require 'chitter'
require 'database_helpers'

describe Chitter do
  describe '.all' do
    it 'returns all my tweets' do

      chitters = Chitter.create(url: 'My first tweet')

      chitter = Chitter.all

      expect(chitter.length).to eq 1
      expect(chitter.first).to be_a Chitter
      expect(chitter.first.id).to eq chitters.id
      expect(chitter.first.url).to eq 'My first tweet'
    end
  end

  describe '.create' do
    it 'creates a new tweet' do
      chitter = Chitter.create(url: 'My first tweet')
      persisted_data =  persisted_data(id: chitter.id)

      expect(chitter).to be_a Chitter
      expect(chitter.id).to eq persisted_data.first['id']
      expect(chitter.url).to eq 'My first tweet'
    end
  end

  describe '.delete' do
    it 'deletes the tweets' do
      chitter = Chitter.create(url: "My first tweet")
      Chitter.delete(id: chitter.id)
      expect(Chitter.all.length). to eq 0
    end
  end

  describe '.update' do
    it 'updates the tweet' do
      chitter = Chitter.create(url: 'My first tweet')
      updated_tweet = Chitter.update(id: chitter.id, url: 'My fourth tweet')

      expect(updated_tweet).to be_a Chitter
      expect(updated_tweet.id).to eq chitter.id
      expect(updated_tweet.url).to eq 'My fourth tweet'
    end
  end

  describe '.find' do
    it 'returns requested tweet object' do
      chitter = Chitter.create(url: 'My first tweet')
      result = Chitter.find(id: chitter.id)

      expect(result).to be_a Chitter
      expect(result.id).to eq chitter.id
      expect(result.url).to eq 'My first tweet'
    end
  end
end
