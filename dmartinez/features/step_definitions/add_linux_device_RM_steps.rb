Given(/^I am logged as an admin in RM using the username: (.*?) and the password: (.*?)$/) do |usr, passwd|
    @login_page = LoginPage.new 
    @login_page.load
    @login_page.username.set usr
    @login_page.passwrd.set passwd
    @login_page.login_button.click
end

When("I click on the \"Infrastructure\" tab of the RM application") do
    @dashboard = DashboardPage.new
    @dashboard.load
    @dashboard.dashboard_page.click
end

Then("I should be able to see a list of all the RM devices") do
  @infrastructure = InfrastructurePage.new
  expect(@infrastructure).to have_device_list
end

When("I click on the $btn button") do |string|
  @infrastructure.add_devices_button.click
end

Then("I should see a list of $dev options") do |string|
  expect(@infrastructure).to have_add_device_options
end

Then("I should be able to see a modal to enter device details") do
  @infrastructure.wait_until_add_device_modal_visible
end

When("I  enter the Linux Server IP Address $ip") do |ip|
    @infrastructure.device_ip_address.set ip
end

Then("I should select the Device Class '$devclass'") do |devclass|
  @infrastructure.device_class.set devclass
end

Then("I should click on '$option'") do |option|
  click_on option
end

Then("I should set as the zCommandUsername as '$usr' and the zCommandPassword '$passwd'") do |usr, passwd|
  @infrastructure.wait_until_server_username_visible
  @infrastructure.server_username.set usr
  @infrastructure.server_password.set passwd
end

Then("I should click on the {string}") do |string|
  @infrastructure.add_button.click
end

Then("I should refresh the device list") do
 refresh_attempts = 10
 refresh_attempts.times do
  @infrastructure.refresh.click
 end
end

When("I see the Infraestructure page displaying I should be able to see the Linux Server IP Address '$string' just added") do |string|
  expect(@infrastructure).to have_xpath("//*[text()='"+string+"']")
end
