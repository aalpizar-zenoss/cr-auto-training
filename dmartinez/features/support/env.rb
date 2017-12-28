require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'

Capybara.configure do |config|
	config.app_host = 'https://10.88.120.20:54321'
	config.default_driver = :selenium_firefox
	config.default_max_wait_time = 10
	config.default_selector = :xpath
	config.run_server = false
end

Capybara.register_driver :selenium_firefox do |app|
	Capybara::Selenium::Driver.new(app, browser: :firefox, marionette: true, desired_capabilities: Selenium::WebDriver::Remote::Capabilities.firefox(acceptInsecureCerts: true))
end
