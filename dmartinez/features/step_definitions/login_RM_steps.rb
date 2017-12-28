Given("I am located within the Zenoss Resmgr Login Page") do
    visit("/")
end

When("I enter an incorrect username") do
    fill_in('username', :with => 'fake22')
end

When("I enter an incorrect password") do
    fill_in('passwrd', :with => 'Zenoss222')
end

When("I enter the submit button") do
    click_button('loginButton')
end

Then("A message should appear") do
    page.has_xpath?('//*[contains(@class, "error")]')
end

When("I don't enter a Username") do
    fill_in('username', :with => '')
end



When("I enter a valid password") do
    fill_in('passwrd', :with => 'Zenoss22')
end

When("I don't enter a password") do
    fill_in('passwrd', :with => '')
end

When("I enter a valid Username") do
    fill_in('username', :with => 'admins')
end

When("I  enter a valid password") do
    fill_in('passwrd', :with => 'Zenoss22')
end

Then("the Dashboard page should be displayed") do
    page.has_xpath?('//*[contains(@class, "bg")]')
end

When("I click Log Out") do
    click_link("sign out")
end

Then("I see the login page") do
    page.has_xpath?('//*[contains(@class, "submitbutton")]')
end
