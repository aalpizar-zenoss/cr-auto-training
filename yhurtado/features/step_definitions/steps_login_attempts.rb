Given /^I am on the login page$/ do
  visit('/')
  puts 'Going to login page...Done'
end

Given /^I fill in username with (.*?)$/ do |username|
  fill_in('username', :with => username)
  puts 'I am filling username with: ' + username
end

Given /^I fill in password with (.*?)$/ do |password|
  fill_in('passwrd', :with => password)
  puts 'I am filling password with: ' + password
end

Given /^I click in log in button$/ do
  click_button('loginButton')
  puts 'Clicking the log in button')
end

Then /^I should see the message (.*?)$/ do |message|
  puts has_css?('span.error').to_s
  page_message = find(:css, 'span.error').text
  puts 'Message: ' + page_message
end

Given /^I am on the dashboard page$/ do
  visit('/zport/dmd/Dashboard')
  puts 'Going to dashboard page...Done'
end

Given /^I click in SING OUT button$/ do
  click_link('sign out')
  puts 'Clicking the SING OUT button'
end
