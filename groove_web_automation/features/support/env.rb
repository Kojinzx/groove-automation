require 'rspec'
require 'page-object'
require "yaml"
require 'pry'
require "pry-nav"
require "faker"
require "cpf_faker"
require "rspec"
require 'selenium/webdriver'
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'rubygems'
require 'site_prism'

World(PageObject::PageFactory)

Capybara.register_driver :selenium do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: {'w3c' => false}
  )
  Capybara::Selenium::Driver.new(app, :browser => :chrome, desired_capabilities: capabilities)
end

Capybara.configure do |config|
  config.default_driver = :selenium
end

Capybara.page.driver.browser.manage.window.maximize

Capybara.default_max_wait_time = 15


ENV['env'] = 'data' unless ENV.key?'env'

$default_data = YAML.load_file('./fixtures/default_data.yml')[ENV['env']]
