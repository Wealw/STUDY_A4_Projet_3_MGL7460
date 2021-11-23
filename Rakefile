# frozen_string_literal: true

require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

task 'default' => ['run']

task :run do
  ruby 'src/PacketLocator.rb'
end

task :unit_test do
  ruby 'test/TestPacketLocator.rb'
end

task :acceptation_test do
  sh 'bundle exec cucumber --quiet --expand --format Teamcity::Cucumber::Formatter'
end