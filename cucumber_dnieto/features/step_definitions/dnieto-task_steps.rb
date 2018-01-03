Given /^User navigate to Login Page$/ do
  @login_page = LoginPage.new
  @login_page.load
end

When /^User enters Username and Password$/ do
  @login_page.username_field.set "username123"
  @login_page.password_field.set "password123"
end

And /^User clicks Login button$/ do
  @login_page.login_button.click
end

Then /^Error message is displayed$/ do
  expect(@login_page).to_not be_displayed 
end

And /^User enters Password$/ do
  @login_page.password_field.set "password123"
end

And /^User enters Username$/ do
  @login_page.username_field.set "username123"
end

When /^User enters Valid Username and Password$/ do
  @login_page.username_field.set "admin"
  @login_page.password_field.set "Zenoss22"
end

And /^User clicks INFRASTRUCTURE tab$/ do
  @dashboard_page = DashboardPage.new
  @dashboard_page.infrastructure_button.click
end

And /^User clicks Add Device button$/ do
  @infrastructure_page = InfrastructurePage.new
  sleep 5
  @infrastructure_page.add_button.click
end

And /^User clicks Add a Single Device button$/ do
  @infrastructure_page.add_single_device.click
  sleep 5
end

Given /^User adds single device with (.*?) (.*?) and (.*?)$/ do |ip, title, deviceclass|
  @infrastructure_page.add_overlay.device_class_field.set deviceclass
  @infrastructure_page.add_device_class(deviceclass)
  @infrastructure_page.add_overlay.hostname_field.set ip
  @infrastructure_page.add_overlay.title_field.set title
  sleep 5
  @infrastructure_page.add_overlay.add_button.click 
end

Then /^User performs Logout process$/ do
  sleep 60
  @dashboard_page.logout_button.click
end