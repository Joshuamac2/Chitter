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
end
