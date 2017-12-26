Given("User navigate to Login Page") do
  @login_page = LoginPage.new
  @login_page.load
end

When("User enters Username and Password") do
  @login_page.username_field.set "username123"
  @login_page.password_field.set "password123"
end

And("User clicks Login button") do
  @login_page.login_button.click
end

Then("Error message is displayed") do
  expect(@login_page).to_not be_displayed 
end

And("User enters Password") do
  @login_page.password_field.set "password123"
end

And("User enters Username") do
  @login_page.username_field.set "username123"
end

When("User enters Valid Username and Password") do
  @login_page.username_field.set "admin"
  @login_page.password_field.set "Zenoss22"
end

And("User clicks INFRASTRUCTURE tab") do
  @dashboard_page = DashboardPage.new
  @dashboard_page.infrastructure_button.click
end

And("User clicks Add Device button") do
  @infrastructure_page = InfrastructurePage.new
  sleep 5
  @infrastructure_page.add_button.click
end

And("User clicks Add a Single Device button") do
  @infrastructure_page.add_single_device.click
end

And("User adds required fields in Add Single Device overlay") do
  @overlay_page = AddSingleDeviceOverlay.new
  @overlay_page.hostname_field.set "10.88.121.239"
  @overlay_page.title_field.set "dnieto-tb1"
 #@overlay_page.device_class_field.set "/Server/SSH/Linux"
  sleep 5
  @overlay_page.add_button.click
end

#Then("User can see the added device") do
#  sleep 60
#  expect(@infrastructure_page).to include("10.88.121.239")
#end

Then("User performs Logout process") do
  sleep 60
  @dashboard_page.logout_button.click
end