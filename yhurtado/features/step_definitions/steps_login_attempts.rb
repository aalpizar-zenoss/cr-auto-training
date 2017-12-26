Given /^I am on the login page$/ do
  @login = LoginPage.new
  @login.load
  expect(page.title).to eq('Login')
end

Given /^I fill in username with (.*?)$/ do |username|
  @login.username.set username
  puts 'I am filling username with: ' + username
end

Given /^I fill in password with (.*?)$/ do |password|
  @login.password.set password
  puts 'I am filling password with: ' + password
end

Given /^I click in log in button$/ do
  @login.login_button.click
  puts 'Clicking the log in button'
end

Then /^I should see the message (.*?)$/ do |message|
  page_message = find(:css, 'span.error').text
  expect(page_message).to eq(message)
  puts 'Message: ' + page_message
end

Then /^I should be on the dashboard page$/ do
  @dashboard = DashboardPage.new
  @dashboard.load
  expect(page.title).to eq('Zenoss: Dashboard')
  puts 'Going to dashboard page...Done'
end

Given /^I click in SING OUT button$/ do
  @dashboard.signout_button.click
  puts 'Clicking the SING OUT button'
end
