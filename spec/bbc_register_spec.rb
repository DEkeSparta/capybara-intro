describe BBCSite do

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
      expect(@bbc_page.find_username?).to be true
    end

    context "on the form page" do

      before :each do |test|
        @bbc_page.input_DOB 10, 5, 1987 unless test.metadata[:on_same_page]
      end

      it "should give 5 errors when submitting nothing", :on_same_page do
        @bbc_page.click_register
        expect(@bbc_page.find_error_box_ids.length).to eq 5
      end

      it "should give 1 email error when submitting everything with a used email" do
        @bbc_page.input_username "com@com.com"
        @bbc_page.input_password "1qaz2wsx3edc"
        @bbc_page.input_postcode "SW1A2AA"
        @bbc_page.select_gender "prefer not to say"
        @bbc_page.click_opt_out
        @bbc_page.click_register
        expect(@bbc_page.find_error_box_ids).to include "form-message-email"
      end

    end

  end

end
