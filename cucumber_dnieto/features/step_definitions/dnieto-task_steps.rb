Given("User navigate to Login Page") do
  print "User is in the Login Page: https://zenoss5.zsd-master"
  visit("/")
end

When("User enters Username and Password") do
  fill_in('username', :with => 'myusername')
  fill_in('passwrd', :with => 'mypassword')
end

And("User clicks Login button") do
  click_button('loginButton')
end

Then("Error message is displayed") do
  print "Your session has expired or you have entered an incorrect username or password."
end

And("User enters Password") do
  fill_in('passwrd', :with => 'mypassword')
end

And("User enters Username") do
  fill_in('username', :with => 'myusername')
end

When("User enters Valid Username and Password") do
  fill_in('username', :with => 'admin')
  fill_in('passwrd', :with => 'Zenoss22')
end

And("User clicks Logout button") do
  click_on 'sign out'
end