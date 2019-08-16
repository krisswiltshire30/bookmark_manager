# frozen_string_literal: true

require 'pg'

class DatabaseConnection
  attr_reader :connection

  def self.setup(database)
    @connection = PG.connect(dbname: database)
  end

  def self.query(sqlaction)
    @connection.exec(sqlaction)
  end
end
