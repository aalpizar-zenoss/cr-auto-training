require 'capybara'
require 'capybara/cucumber'

Capybara.configure do |config|
  config.app_host = 'https://yhurtado-tb1.zenoss.lab:54321'
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 10
  config.default_selector = :xpath
  config.run_server = false
end

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :selenium_firefox do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end
