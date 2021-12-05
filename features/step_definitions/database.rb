# frozen_string_literal: true

class Domain < ActiveRecord::Base
  attribute :fqdn, :string
end

Given('the database contains no tracked domain') do
  ActiveRecord::Schema.define(version: 1.0) do
    self.verbose = false
    create_table(:domains, force: true) do |t|
      t.string :fqdn, null: false
    end
    add_index :domains, :fqdn, unique: true
  end
end

Given('the database contains a tracked domain with the fqdn attribute set to {string}') do |string|
  Domain.create(fqdn: string)
end

Given('there is database file called {}') do |_string|
  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: './domain-observer.sqlite'
  )
end

Given('there is no database file called {string}') do |string|
  `rm ./#{string}`
end

Then('there should be a database file called {string}') do |string|
  @output = `cat ./#{string}`
  expect(@output).not_to include('No such file or directory')
end

Then('the database should contain no record') do
  @output = Domain.all.length
  expect(@output).to eq 0
end

Then('the database should contains a tracked domain with the fqdn attribute set to {string}') do |string|
  @output = Domain.find_by(fqdn: string)
  expect(@output).not_to be_nil
end
