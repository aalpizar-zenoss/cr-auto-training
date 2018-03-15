
Given (/^I am on the Zenoss loginpage$/) do
  visit("/")
  page.has_title?('Login')
end

When (/^enter with invalid username:$/) do |table|
  table_hash = table.hashes
  #find(:xpath, "//*[@id='username']").set("my_username")
  fill_in('username', :with => table_hash[0]['username'])
end

And (/^enter with invalid password:$/) do |table|
  table_hash = table.hashes
  find(:xpath, "//*[@id='passwrd']").set(table_hash[0]['password'])
  # fill_in('passwrd', :with => 'Zenoss')
end

Then (/^error login shown$/) do
  #find(:xpath, '//*[@id="loginButton"]').click
  click_button('loginButton')
  puts find(:xpath, '//*[@id="errorbox"]/span').text
  has_css?('.error')
  has_content?('entered an incorrect username or password')

end

When (/^enter with valid password:$/) do |table|
  table_hash = table.hashes
  fill_in('passwrd', :with => table_hash[0]['password'])
end


When (/^enter with valid username:$/) do |table|
  table_hash = table.hashes
  fill_in('username', :with => table_hash[0]['username'])
end

Then (/^enter with valid username and password:$/) do |table|
  table_hash = table.hashes
  fill_in('username', :with => table_hash[0]['username'])
  fill_in('passwrd', :with => table_hash[0]['password'])
end

Then (/^I am on the Zenoss page$/) do
  click_button('loginButton')
  page.has_title?('Zenoss: Dashboard')
end

When (/^I click the SIGN OUT button$/) do
  find(:xpath, '//*[@id="sign-out-link"]').click
end

And (/^the loginpage is shown$/) do
  page.has_title?('Login')
end
