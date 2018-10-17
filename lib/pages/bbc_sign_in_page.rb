require "capybara"

class BBCSignInPage
  SIGN_IN_URL = "https://account.bbc.com/signin"
  USERNAME_ID = "user-identifier-input"
  PASSWORD_ID = "password-input"
  SUBMIT_ID   = "#submit-button"
  ERROR_CLASS = ".form-message--error"

  def initialize
    Capybara::register_driver :chrome do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
    end
    @session = Capybara::Session.new :chrome
  end

  def visit_sign_in_page
    @session.visit(SIGN_IN_URL)
  end

  def input_username username
    @session.fill_in(USERNAME_ID, with: username)
  end

  def input_password password
    @session.fill_in(PASSWORD_ID, with: password)
  end

  def click_sign_in
    @session.find(SUBMIT_ID).click
  end

  def find_error_box_ids
    if @session.has_css?(ERROR_CLASS)
      error_box = @session.all(ERROR_CLASS)
      return error_box.map {|err| err[:id]}
    else
      return nil
    end
  end

end
