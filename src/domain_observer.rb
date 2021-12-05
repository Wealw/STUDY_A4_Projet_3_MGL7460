# frozen_string_literal: true

require 'optparse'
require './src/domain_helper'

# Handle flags given to the script
OptionParser.new do |parser|
  parser.on('-a', '--add=DOMAIN') do |domain|
    DomainHelper.create_domain domain
  end
  parser.on('-d', '--delete=DOMAIN') do |domain|
    DomainHelper.delete_domain domain
  end
  parser.on('-s', '--show') do
    DomainHelper.analyse_domains
  end
end.parse!
exit(0)
