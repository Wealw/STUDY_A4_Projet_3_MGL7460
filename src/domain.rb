# frozen_string_literal: true

require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: './domain-observer.sqlite'
)

suppress(ActiveRecord::StatementInvalid) do
  ActiveRecord::Schema.define(version: 1.0) do
    self.verbose = false
    create_table(:domains) do |t|
      t.string :fqdn, null: false
    end
    add_index :domains, :fqdn, unique: true
  end
end

# Class for storing fqdn in a database using ActiveRecord
class Domain < ActiveRecord::Base
  attribute :fqdn, :string
end
