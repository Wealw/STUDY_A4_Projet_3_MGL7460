# frozen_string_literal: true

Then('output should contains one of the followings : {string} or {string}') do |string, string2|
  expect(@output).to include(string).or include(string2)
end
