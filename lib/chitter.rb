require 'pg'

class Chitter

  attr_reader :id, :url

  def initialize(id:, url:)
    @id = id
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM tweets')
    result.map do |tweets|
      Chitter.new(id: tweets['id'], url: tweets['url'])
    end
  end

  def self.create(url:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO tweets (url) VALUES('#{url}') RETURNING id, url;")
    Chitter.new(id: result[0]['id'], url: result[0]['url'])
  end
end
