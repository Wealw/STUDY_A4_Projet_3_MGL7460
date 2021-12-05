# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest'
require './src/domain_helper'

class DomainHelperTest < Minitest::Test

  def test_create_domain
    #DomainHelper.create_domain "example.com"
    assert_equal true, false
  end

  def test_delete_domain
    #DomainHelper.delete_domain "example.com"
    assert_equal true, false
  end

  def test_analyse_domains
    #DomainHelper.create_domain "example1.com"
    #DomainHelper.create_domain "example2.com"
    assert_equal true, false
  end

  def test_analyse_from_json
    #DomainHelper.analyse_from_json "example.com", "{}"
    assert_equal true, false
  end
end
