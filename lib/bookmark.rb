# frozen_string_literal: true

require 'pg'
require './lib/database_connection'
require_relative 'connection_helper.rb'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM bookmarks;')
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
    end

  def self.add(title:, url:)
    DatabaseConnection.query("INSERT INTO bookmarks (title, url) VALUES ('#{title}','#{url}');")
  end

  def self.delete(title)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE title='#{title}';")
  end

  def self.update_url(title, url = 0)
    DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}' WHERE title = '#{title}';")
  end

  def self.update_title(title1, title2)
    DatabaseConnection.query("UPDATE bookmarks SET title = '#{title2}' WHERE title = '#{title1}';")
  end


end
