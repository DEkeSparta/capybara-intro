require "capybara"

class BBCSignUpPage
  SIGN_UP_URL = "https://account.bbc.com/register"
  USERNAME_ID = "user-identifier-input"
  PASSWORD_ID = "password-input"
  SUBMIT_ID   = "#submit-button"
  ERROR_CLASS = ".form-message--error"
  DAY_FIELD_ID = "day-input"
  MONTH_FIELD_ID = "month-input"
  YEAR_FIELD_ID = "year-input"
  DOB_SUBMIT_ID = "#submit-button"

  def initialize
    Capybara::register_driver :chrome do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
    end
    @session = Capybara::Session.new :chrome
  end

  def visit_sign_up_page
    @session.visit(SIGN_UP_URL)
  end

  def click_over_thirteen
    @session.find('a[aria-label="13 or over"]').click
  end

  def input_DOB day, month, year
    @session.fill_in DAY_FIELD_ID, with: day
    @session.fill_in MONTH_FIELD_ID, with: month
    @session.fill_in YEAR_FIELD_ID, with: year
    @session.find(DOB_SUBMIT_ID).click
  end

  def find_username
    @session.find("#"+USERNAME_ID)
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
