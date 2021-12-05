# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest'
require './src/domain_helper'
require 'database_cleaner'

class DomainHelperTest < Minitest::Test
  DatabaseCleaner.strategy = :truncation

  def test_create_domain
    # Setup
    DatabaseCleaner.clean
    # Test
    capture_io do
      DomainHelper.create_domain 'example.com'
    end
    # Assertion
    result = Domain.find_by(fqdn: 'example.com')
    assert !result.nil?
  end

  def test_delete_domain
    # Setup
    DatabaseCleaner.clean
    Domain.create(fqdn: 'example.com')
    # Test
    capture_io do
      DomainHelper.delete_domain 'example.com'
    end
    # Assertion
    result = Domain.find_by(fqdn: 'example.com')
    assert result.nil?
  end

  def test_analyse_domains
    # Setup
    DatabaseCleaner.clean
    Domain.create(fqdn: 'example1.com')
    Domain.create(fqdn: 'example2.com')
    # Test
    result, = capture_io do
      DomainHelper.analyse_domains
    end
    # Assertion
    assert !result.match(/is owned with the following NS record|is currently not used by anybody/).nil?
  end

  def test_analyse_from_json
    # Setup
    DatabaseCleaner.clean
    Domain.create(fqdn: 'example.com')
    domain = Domain.find_by(fqdn: 'example.com')
    json = JSON.parse '{"status": "success", "message": "NS record has been retrieved for example.com successful'\
                              'ly", "data": {"query": {"type": "NS", "name": "example.com"}, "answer": ["b.iana-server'\
                              's.net.", "a.iana-servers.net."]}}'
    # Test
    result, = capture_io do
      DomainHelper.analyse_from_json domain, json
    end
    # Assertion
    assert !result.match(/is owned with the following NS record|is currently not used by anybody/).nil?
  end
end
