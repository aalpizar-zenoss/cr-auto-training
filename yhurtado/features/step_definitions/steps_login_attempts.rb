Given /^I am on the login page$/ do
  puts 'Going to login page...Done'
end

Given /^I fill in username with (.*?)$/ do |username|
  puts 'I am filling username with: ' + username
end

Given /^I fill in password with (.*?)$/ do |password|
  puts 'I am filling password with: ' + password
end

Then /^I should see the message (.*?)$/ do |message|
  puts 'This is the message: ' + message
end

Given /^I am on the dashboard page$/ do
  puts 'Going to dashboard page...Done'
end

Given /^I click in SING OUT button$/ do
  puts 'Clicking the SING OUT button'
end


