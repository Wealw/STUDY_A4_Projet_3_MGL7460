# frozen_string_literal: true

require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

task 'default' => ['run']

task :run do
  puts `ruby ./src/domain_observer.rb -s`
end

task :unit_test do
  Dir['test/**/*.rb'].each { |s| ruby s }
end

task :acceptation_test do
  sh 'bundle exec cucumber --quiet --expand --format Teamcity::Cucumber::Formatter'
end
