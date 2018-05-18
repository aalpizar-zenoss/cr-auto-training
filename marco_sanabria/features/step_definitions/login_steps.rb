Given("I am at the login page") do
  @login_page ||= Pages::Login.new
  @login_page.load
end

When(/^I enter username "(.*?)"$/) do |invalid_username|
  @login_page.username_field.set(invalid_username)
end

When(/^I enter password "(.*?)"$/) do |password|
  @login_page.password_field.set(password)
end

Then(/^I expect to see the message "(.*?)"$/) do |message|
  expect(message).to be('Your session has expired or you have entered an incorrect username or password')
end

When("I successfully login") do
  @login_page.login_as_admin
end

When("I then logout") do
  @login_page.logout
end

Then("I expect to be back at the login page") do
  expect(page).to have_css('#loginButton', visible: true)
end
