require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'site_prism'

Capybara.configure do |config|
  config.app_host = 'https://zenoss5.auto-set11-vm1.zenoss.lab/'
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 10
  config.default_selector = :css
  config.run_server = false
end

Capybara.register_driver :selenium_chrome do |app|
  Selenium::WebDriver::Chrome.driver_path = "#{ENV['DRIVERS']}chromedriver"
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :selenium_firefox do |app|
  Selenium::WebDriver::Chrome.driver_path = "#{ENV['DRIVERS']}geckodriver"
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
