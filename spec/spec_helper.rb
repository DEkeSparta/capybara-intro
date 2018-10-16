require "capybara"
require_relative "../lib/bbc_site.rb"

RSpec.configure do |config|
  config.formatter = :documentation
end

Capybara.configure do |config|
  # config.ignore_hidden_elements = false
  config.default_max_wait_time = 10
  config.match = :prefer_exact
  config.default_driver = :chrome
end
