# frozen_string_literal: true

require 'active_record'
require 'database_cleaner'

Before do
  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: './domain-observer.sqlite'
  )
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean
end

After do
  ActiveRecord::Base.connection.close
end
