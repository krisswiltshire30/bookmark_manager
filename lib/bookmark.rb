# frozen_string_literal: true

require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end
    result = connection.exec('SELECT * FROM bookmarks;')
    result.map do |bookmark|
       Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
    end

  def self.add(title:, url:)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end
    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('#{title}','#{url}');")
  end
end

all_bookmarks = Bookmark.all
all_bookmarks.each do |bookmark|
   bookmark.id
end
