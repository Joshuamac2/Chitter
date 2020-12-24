require 'chitter'

describe Chitter do
  describe '.all' do
    it 'returns all my tweets' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO TWEETS (URL) VALUES ('My first tweet');")
      connection.exec("INSERT INTO TWEETS (URL) VALUES ('My second tweet');")

      chitter = Chitter.all
      
      expect(chitter).to include 'My first tweet'
      expect(chitter).to include 'My second tweet'
    end
  end
end
