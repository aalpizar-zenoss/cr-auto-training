class AdvancePage < SitePrism::Page

  set_url('/zport/dmd/editSettings')

  element :add_ldap_button, 'button#ldapaddbutton-btnEl'
  element :host_input, 'input[name="host_0"]'
  element :manager_dn_input, 'input[name="managerDN"]'

  def add_ldap_configuration host, manager_dn, password
    wait_until_add_ldap_button_visible(10)
    add_ldap_button.click
    within('div.x-window-default-plain') do
      fill_in 'host_0', with: host
      sleep 0.3
      fill_in 'managerDN', with: manager_dn
      sleep 0.3
      fill_in 'managerPassword', with: password
      sleep 0.3
      click_link_or_button('Next')
    end
  end

  def configure_ldap_plugin users_base_dn, groups_base_dn
    within('div.x-window-default-plain') do
      fill_in 'userBaseDN', with: users_base_dn
      sleep 0.3
      fill_in 'groupBaseDN', with: groups_base_dn
      click_link_or_button('Next')
    end
  end

  def map_ldap_group group, role
    within('div.x-window-default-plain') do
      click_link_or_button('Finish')
    end
  end

end
