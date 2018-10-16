# require "capybara"
#
# Capybara.register_driver :chrome do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :chrome)
# end
#
# session = Capybara::Session.new(:chrome)
#
# session.visit("http://toolsqa.com/automation-practice-form/")
# session.fill_in("firstname", with: "Joe")
#
# session.choose("sex-0")
#
# session.find(:css, "#exp-0").click
#
# session.select("Switch Commands", from: "selenium_commands")
#
# sleep 2
