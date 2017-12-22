Given("I am on the login page") do
   visit ("/")
end

When("I attent to login with invalid credentials") do
    fill_in('username', :with => 'admin1')
    fill_in('passwrd', :with => 'Zenoss')
end

When("I press the submit button") do
  click_button('loginButton')
end

Then("a message shoul be displayed") do
    has_css?('.error')
end

When("I attent to login without type a username") do
     fill_in('username', :with => ' ')
end

When("the password is correct") do
    fill_in('passwrd', :with => 'Zenoss22')
end

Then("a message should be displayed") do
    has_css?('.error')
end

When("I attent to login without type a password") do
    fill_in('passwrd', :with => ' ')
end

When("the username is correct") do
     fill_in('username', :with => 'admin')
end

When("I attent to login with correct credentials") do
      fill_in('username', :with => 'admin')
      fill_in('passwrd', :with => 'Zenoss22')
end

Then("the Dashboard page should be displayed") do
     has_css?('combobox-1060-labelEl')
end

Then("I press the logout button") do
    click 'sign out'
end

Then("I should be redirect to the login page") do
 	   has_css?('username')
end