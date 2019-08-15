def db_connection_setup
  if ENV['ENVIRONMENT'] == 'test'
    PG.connect(dbname: 'bookmark_manager_test')
  else
    PG.connect(dbname: 'bookmark_manager')
  end
end
