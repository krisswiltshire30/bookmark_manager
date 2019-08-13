require 'pg'

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec('SELECT * FROM bookmarks;')
    result.map { |row| row['url'] }
    end

    def add(test)
      connection = PG.connect(dbname: 'bookmark_manager')
      connection.exec("INSERT INTO bookmarks (url) VALUES (#{test});")
    end
end
