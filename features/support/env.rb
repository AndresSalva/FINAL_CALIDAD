begin
  require 'rspec/expectations'
rescue LoadError
  require 'spec/expectations'
end

require 'capybara'
require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'selenium-webdriver'


ENV['USER'] ||= 'standard_user'
ENV['PSW']  ||= 'secret_sauce'

Capybara.configure do |config|
  config.run_server = false
  config.default_max_wait_time = 15
  config.app_host = 'https://www.saucedemo.com'
  config.default_driver = :selenium_chrome
end

Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--start-maximized')
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

World(RSpec::Matchers)
