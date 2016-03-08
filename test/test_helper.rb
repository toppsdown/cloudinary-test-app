ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'capybara'
require 'capybara/webkit'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  include Capybara::DSL
  include Capybara::RspecMatchers

  Capybara.configure do |config|
    config.default_wait_time = 5
    config.javascript_driver = :webkit
  end

  Capybara::Webkit.configure do |config|
    config.debug = ENV.key?('DEBUG')
    config.allow_unknown_urls
    config.timeout = 10
    config.ignore_ssl_errors
    config.skip_image_loading
  end
end
