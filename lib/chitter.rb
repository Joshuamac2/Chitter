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

  def self.delete(id:)
    if ENV['ENVIRONMENT'] =='test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("DELETE FROM tweets WHERE id = #{id}")
  end

  def self.update(id:, url:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("UPDATE tweets SET url = '#{url}' WHERE id = #{id} RETURNING id, url;")
    Chitter.new(id: result[0]['id'], url: result[0]['url'])
  end

  def self.find(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM tweets WHERE id = #{id};")
    Chitter.new(id: result[0]['id'], url: result[0]['url'])
  end
end
