# frozen_string_literal: true

require './src/domain'
require 'net/http'
require 'uri'

# Helper for Domain
class DomainHelper
  # Act as an interface for saving fqdn to the database
  def self.create_domain(domain)
    Domain.create(fqdn: domain)
    puts "The domain #{domain} was added to the tracking database."
  rescue ActiveRecord::StatementInvalid
    puts 'An error occurred when the document was try to be inserted in the database.'
    exit(29)
  end

  # Act as an interface for deleting fqdn from the database
  def self.delete_domain(domain)
    raise ActiveRecord::StatementInvalid unless Domain.delete(Domain.find_by(fqdn: domain)) != 0

    puts "The domain #{domain} was removed to the tracking database."
  rescue ActiveRecord::StatementInvalid
    puts 'An error occurred when the document was try to be remove from the database.'
    exit(29)
  end

  # Act as an interface to retrieve fqdn from the database and analyse them
  def self.analyse_domains
    Domain.all.each do |domain|
      raise TypeError unless domain.is_a? Domain

      uri = URI.parse("https://host-t.com/NS/#{domain.fqdn}/")
      response = Net::HTTP.get_response(uri)
      json = JSON.parse response.body
      analyse_from_json(domain, json)
    end
  end

  # Take a fqdn and associated json data and print it
  def self.analyse_from_json(domain, json)
    raise TypeError unless domain.is_a? Domain

    if json['status'] == 'success'
      puts "#{domain.fqdn} is owned with the following NS record #{json['data']['answer'].join ', '} ."
    else
      puts "#{domain.fqdn} is currently not used by anybody."
    end
  end
end
