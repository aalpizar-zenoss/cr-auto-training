class LoginPage < SitePrism::Page
  set_url('/')
  element :username, '#username'
  element :password, '#passwrd'
  element :login_button, '#loginButton'
end
