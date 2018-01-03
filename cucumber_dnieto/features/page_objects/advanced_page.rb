require 'site_prism'

class AdvancedPage < SitePrism::Page
	set_url "/zport/dmd/manageLDAPConfig"
	element :ldap, :css, "a[href='/zport/dmd/manageLDAPConfig']"
	element :add_button, :css, "div[id='ldapaddbutton']"
	element :finish_button, "//*[contains(text(),'Finish')]"

	class AddLDAPConfigOverlay < SitePrism::Section
		element :host_field, :css, "input[name='host_0']"
		element :manager_dn, :css, "input[name='managerDN']"
		element :manager_psw, :css, "input[name='managerPassword']"
		element :next_button, "//*[contains(text(),'Next')]"
	end

	class ConfigLDAPluginOverlay < SitePrism::Section
		element :login_name_attribute, :css, "input[name='loginNameAttr']"
		element :user_base_dn, :css, "input[name='userBaseDN']"
		element :group_base_dn, :css, "input[name='groupBaseDN']"
		element :user_filter, :css, "input[name='extraUserFilter']"
		element :group_filter, :css, "input[name='extraGroupFilter']"
		element :next_button, "//*[contains(text(),'Next')]"
	end

	section :add_ldap, AddLDAPConfigOverlay, :css, 'div.x-window'
    section :config_ldap_plugin, ConfigLDAPluginOverlay, :css, 'div.x-window'

    def add_login_name_attr attribute
		xpath_device_class = '//li[contains(text(),"'+ attribute + '")]'
		find(:xpath, xpath_device_class).click
	end

end