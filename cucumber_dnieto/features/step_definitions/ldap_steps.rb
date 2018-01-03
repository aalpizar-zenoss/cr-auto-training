Given /^User can access to Login Page$/ do
  @login_page = LoginPage.new
  @login_page.load
end

Given /^User enters (.*?) in user field$/ do |username|
  @login_page.username_field.set username
end

Given /^User enters (.*?) in password field$/ do |password|
  @login_page.password_field.set password
  @login_page.login_button.click
end

Given /^User is logged with (.*?) and (.*?) as Admin user to ResMgr$/ do |username, password|
	step "User enters #{username} in user field"
	step "User enters #{password} in password field"
end

And /^User can access to ADVANCED options$/ do
  @dashboard_page = DashboardPage.new
  @dashboard_page.advance_button.click
end

And /^User click button to add a new LDAP Configuration$/ do
  @advanced_page = AdvancedPage.new
  @advanced_page.ldap.click
  @advanced_page.add_button.click
end

Given /^User add a LDAP server with the following values:$/ do |table|
  table_hash = table.hashes
  @advanced_page.add_ldap.host_field.set table_hash[0]['host']
  @advanced_page.add_ldap.manager_dn.set table_hash[0]['managerdn']
  @advanced_page.add_ldap.manager_psw.set table_hash[0]['managerpsw']
  sleep 5
end

Then /^User clicks Add LDAP Servers Next button$/ do
  @advanced_page.add_ldap.next_button.click
end

And /^User add required values (.*?) (.*?) (.*?) (.*?)$/ do |usersbasedn, groupsbasedn, usefilter, groupfilter|
  @advanced_page.config_ldap_plugin.user_base_dn.set usersbasedn
  @advanced_page.config_ldap_plugin.group_base_dn.set groupsbasedn
  @advanced_page.config_ldap_plugin.user_filter.set usefilter
  @advanced_page.config_ldap_plugin.group_filter.set groupfilter
  @advanced_page.config_ldap_plugin.login_name_attribute.click
  @advanced_page.config_ldap_plugin.login_name_attribute.click
  sleep 5
end

Then /^User clicks Configure LDAP Plugin Next button$/ do
  @advanced_page.config_ldap_plugin.next_button.click
end

And /^User clicks Finish button$/ do
  @advanced_page.finish_button.click
  sleep 10
end