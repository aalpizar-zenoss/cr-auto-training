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

And("User performs Logout process") do
  @dashboard_page = DashboardPage.new
  @dashboard_page.logout_button.click
end