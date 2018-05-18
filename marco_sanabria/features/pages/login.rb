module Pages
  class Login < SitePrism::Page
    set_url('/')

    element(:username_field, Locator.username)
    element(:password_field, Locator.password)
    element(:login_button, Locator.login_btn)
    element(:logout_button, Locator.logout_btn)

    def login_as_admin
      Bot::User.type_on(username_field, 'admin')
      Bot::User.type_on(password_field, 'Zenoss22')
      Bot::User.click_on(login_button)
    end

    def logout
      Bot::User.click_on(logout_button)
    end
  end
end
