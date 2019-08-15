# frozen_string_literal: true

require 'pg'
require_relative 'connection_helper.rb'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    connection = db_connection_setup
    result = connection.exec('SELECT * FROM bookmarks;')
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
    end

  def self.add(title:, url:)
    connection = db_connection_setup
    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('#{title}','#{url}');")
  end

  def self.delete(title)
    connection = db_connection_setup
    connection.exec("DELETE FROM bookmarks WHERE title='#{title}';")
  end

  def self.update_url(title, url = 0)
    connection = db_connection_setup
    connection.exec("UPDATE bookmarks SET url = '#{url}' WHERE title = '#{title}';")
  end

  def self.update_title(title1, title2)
    connection = db_connection_setup
    connection.exec("UPDATE bookmarks SET title = '#{title2}' WHERE title = '#{title1}';")
  end
end
