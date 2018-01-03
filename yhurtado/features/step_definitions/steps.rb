Given /^I am on the login page$/ do
  @login = LoginPage.new
  @login.load
  expect(page.title).to eq('Login')
end

When /^I am on the Infrastructure page$/ do
  @infrastructure = InfrastructurePage.new
  @infrastructure.load
  expect(page.title).to eq('Zenoss: Devices')
end

When /^I am on the Advance page$/ do
  @advance = AdvancePage.new
  @advance.load
  expect(page.title).to eq('Zenoss: Settings')
end

Given /^I am logged in with "(.*?)" and "(.*?)"$/ do |username, password|
  @login = LoginPage.new
  @login.load
  @login.login_with username, password
  @dashboard = DashboardPage.new
end

Given /^I am logged in with admin user$/ do
  step 'I am logged in with "admin" and "Zenoss22"'
end

Given /^I fill in username with (.*?)$/ do |username|
  @login.username.set username
end

Given /^I fill in password with (.*?)$/ do |password|
  @login.password.set password
end

Given /^I click in log in button$/ do
  @login.login_button.click
  @dashboard = DashboardPage.new
end

Given /^I click on LDAP left menu$/ do
  click_link('LDAP')
end

When /^I add a LDAP server with host "(.*?)", manager DN "(.*?)", manager PWD "(.*?)"$/ do |host, manager_dn, password|
  @advance.add_ldap_configuration(host, manager_dn, password)
end


When /^I configure the LDAP with users base DN "(.*?)", groups base DN "(.*?)"$/ do |users_base_dn, groups_base_dn|
  @advance.configure_ldap_plugin(users_base_dn, groups_base_dn)
end
  
When /^I map the LDAP group "(.*?)" with the role "(.*?)"$/ do |group, role|
  @advance.map_ldap_group(group, role)
  expect(@advance).not_to have_selector('div.x-window-default-plain')  
  click_link('LDAP')
end

Then /^I should see the LDAP configuration with host "(.*?)" and manager DN "(.*?)"$/ do |host, manager_dn|
  expect(@advance.host_input.value).to eq(host)
  expect(@advance.manager_dn_input.value).to eq(manager_dn)
end

Then /^I should see the message (.*?)$/ do |message|
  page_message = find(:css, 'span.error').text
  expect(page_message).to eq(message)
end

Then /^I should be on the dashboard page$/ do
  @dashboard = DashboardPage.new
  @dashboard.load
  expect(page.title).to eq('Zenoss: Dashboard')
end

Given /^I click in SING OUT button$/ do
  @dashboard.signout_button.click
end

Given /^I add a single device with ip:(.*?) and class:(.*?)$/ do |ip, device_class|
  @infrastructure.add_single_device ip, device_class
end

Then /^I should see device ip:(.*?) class:(.*?)$/ do |ip, device_class|
  @infrastructure.refresh_button.click
  page.should have_content(ip)
  page.should have_content(device_class)
end
