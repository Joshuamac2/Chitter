require 'chitter'

describe Chitter do
  describe '.all' do
    it 'returns all my tweets' do
      chitter = Chitter.all
      expect(chitter).to include('My first tweet')
      expect(chitter).to include('My second tweet')
    end
  end
end
