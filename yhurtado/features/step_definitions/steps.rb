Given /^I am on the login page$/ do
  @login = LoginPage.new
  @login.load
  expect(page.title).to eq('Login')
end

When /^I am on the Infrastructure page$/ do
  @infrastructure = InfrastructurePage.new
  @infrastructure.load
  expect(page.title).to eq('Zenoss: Devices')
end

Given /^I am logged in with "(.*?)" and "(.*?)"$/ do |username, password|
  @login = LoginPage.new
  @login.load
  @login.login_with username, password
  @dashboard = DashboardPage.new
end

Given /^I fill in username with (.*?)$/ do |username|
  @login.username.set username
end

Given /^I fill in password with (.*?)$/ do |password|
  @login.password.set password
end

Given /^I click in log in button$/ do
  @login.login_button.click
  @dashboard = DashboardPage.new
end

Then /^I should see the message (.*?)$/ do |message|
  page_message = find(:css, 'span.error').text
  expect(page_message).to eq(message)
end

Then /^I should be on the dashboard page$/ do
  @dashboard = DashboardPage.new
  @dashboard.load
  expect(page.title).to eq('Zenoss: Dashboard')
end

Given /^I click in SING OUT button$/ do
  @dashboard.signout_button.click
end

Given /^I add a single device with ip:(.*?) and class:(.*?)$/ do |ip, device_class|
  @infrastructure.add_single_device ip, device_class
end

Then /^I should see device ip:(.*?) class:(.*?)$/ do |ip, device_class|
  sleep 3
  @infrastructure.refresh_button.click
  page.should have_content(ip)
  page.should have_content(device_class)
end
