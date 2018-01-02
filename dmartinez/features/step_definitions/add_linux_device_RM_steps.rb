Given("I am logged as an admin in RM using the username: admin and the password: Zenoss{int}") do |int|
    @login_page = LoginPage.new 
    @login_page.load
    @login_page.username.set "admins"
    @login_page.passwrd.set "Zenoss22"
    @login_page.login_button.click
end

When("I click on the {string} tab of the RM application") do |string|
    @dashboard = DashboardPage.new
    @dashboard.load
    @dashboard.dashboard_page.click
end

Then("I should be able to see a list of all the RM devices") do
  @infrastructure = InfrastructurePage.new
  expect(@infrastructure).to have_device_list
end

When("I click on the {string} button") do |string|
  @infrastructure.add_devices_button.click
end

Then("I should see a list of {string} options") do |string|
  expect(@infrastructure).to have_add_device_options
end

When("I click on {string}") do |string|
  @infrastructure.add_single_device.click
end

Then("I should be able to see a modal to enter device details") do
  expect(@infrastructure).to have_add_device_modal
end

Then("I should enter the Linux Server IP Address {string}") do |string|
  @infrastructure.device_ip_address.set "10.88.120.20"
end

Then("I should select the Device Class {string}") do |string|
  @infrastructure.device_class.set "/Server/SSH/Linux"
end

Then("I should click on {string}") do |string|
  @infrastructure.more_link.click
end

Then("I should set as the zCommandUsername as {string} and the zCommandPassword {string}") do |string, string2|
  @infrastructure.server_username.set "root"
  @infrastructure.server_password.set "D0gP0und!"
end

Then("I should click on the {string}") do |string|
  @infrastructure.add_button.click
end

Then("I should refresh the device list") do
  @infrastructure.refresh.click
end

When("I see the Infraestructure page displaying I should be able to see the device just added") do
  sleep(20)
  @infrastructure.refresh.click
  sleep(10)
  expect(@infrastructure).to have_added_device
end
