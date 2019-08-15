# frozen_string_literal: true

def open_test_db
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmarks (id,title,url) VALUES (1, 'test1', 'http://www.makersacademy.com');")
  connection.exec("INSERT INTO bookmarks (id,title,url) VALUES(2, 'test2', 'http://www.destroyallsoftware.com');")
  connection.exec("INSERT INTO bookmarks (id,title,url) VALUES(3, 'test3', 'http://www.google.com');")
  visit '/bookmarks'
end
