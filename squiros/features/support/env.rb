require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.configure do |config|
  config.app_host = 'https://zenoss5.ip-10-111-2-219.zenoss.loc'
  config.default_driver = :selenium_chrome
	config.default_max_wait_time = 10
  config.default_selector = :xpath
	config.run_server = false
end

Capybara.register_driver :selenium_chrome do |app|
  Selenium::WebDriver::Chrome.driver_path = 'C:\Users\Sergio Gonzalez\Documents\Drivers\chromedriver.exe'
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :selenium_firefox do |app|
  Selenium::WebDriver::Firefox.driver_path = 'geckodriver'
  Capybara::Selenium::Driver.new(app, browser: :firefox, marionette: true)
end
