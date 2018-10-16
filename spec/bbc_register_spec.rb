describe BBCSite do
  before :all do
    # VALID_EMAIL = "email@example.com"
    VALID_EMAIL = "yojso@chineese.com"
    INVALID_EMAIL = "not@valid.email"
    PASSWORD = "1qaz2wsx3edc4rfv"
  end

  context "sign up page" do

    before :all do
      @bbc_page = BBCSite.new.bbc_sign_up_page
    end

    before :each do |test|
      @bbc_page.visit_sign_up_page unless test.metadata[:on_same_page]
      @bbc_page.click_over_thirteen
    end

    it "should bring up an error when selecting an age under 13" do
      @bbc_page.input_DOB 10, 10, 2010
      expect(@bbc_page.find_error_box_ids).to include "form-message-dateOfBirth"
    end

    it "should bring up an error when selecting an invalid age" do
      @bbc_page.input_DOB 10, 15, 1987
      expect(@bbc_page.find_error_box_ids).to include "form-message-dateOfBirth"
    end

    it "should continue when inputting a valid age" do
      @bbc_page.input_DOB 10, 5, 1987
      expect(@bbc_page.find_username).to have_css "#user-identifier-input"
    end

    context "on the form page" do

      before :each do
        @bbc_page.input_DOB 10, 5, 1987
      end

      it "should give 5 errors when submitting nothing" do
        true
      end

    end

  end

end
