# frozen_string_literal: true

require 'English'
When('the application run') do
  @output = `ruby ./src/domain_observer.rb`
end

When('the app is called with the flag : {string}') do |string|
  @output = `ruby ./src/domain_observer.rb #{string}`
  @exit_code = $CHILD_STATUS.exitstatus.to_i
end

Then('the return code of the script should be {int}') do |int|
  expect(@exit_code).to eq int
end
