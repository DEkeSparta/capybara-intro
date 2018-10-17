describe BBCSite do
  before :all do
    # VALID_EMAIL = "email@example.com"
    VALID_EMAIL = "yojso@chineese.com"
    INVALID_EMAIL = "not@valid.email"
    PASSWORD = "1qaz2wsx3edc4rfv"
  end

  context "sign in page" do

    before :all do
      @bbc_page = BBCSite.new.bbc_sign_in_page
    end

    before :each do |test|
      @bbc_page.visit_sign_in_page unless test.metadata[:on_same_page]
    end

    it "should produce an error when inputting an incorrect password for a valid account" do
      @bbc_page.input_username VALID_EMAIL
      @bbc_page.input_password PASSWORD
      @bbc_page.click_sign_in

      expect(@bbc_page.find_error_box_ids).to include "form-message-password"
    end

    it "should produce an error when inputting an incorrect email" do
      @bbc_page.input_username INVALID_EMAIL
      @bbc_page.input_password PASSWORD
      @bbc_page.click_sign_in

      expect(@bbc_page.find_error_box_ids).to include "form-message-username"
    end

    it "should produce two errors when inputting an email only" do
      @bbc_page.input_username VALID_EMAIL
      @bbc_page.click_sign_in

      errors = @bbc_page.find_error_box_ids
      expect(errors).to include "form-message-general"
      expect(errors).to include "form-message-password"
    end

    it "and should remove the error messages once the password box is typed in", :on_same_page do
      @bbc_page.input_password PASSWORD
      expect(@bbc_page.find_error_box_ids).to eq nil
    end

    it "should produce two errors when inputting a password only" do
      @bbc_page.input_password PASSWORD
      @bbc_page.click_sign_in

      errors = @bbc_page.find_error_box_ids
      expect(errors).to include "form-message-general"
      expect(errors).to include "form-message-username"
    end

    it "and should remove the error messages once the username box is typed in", :on_same_page do
      @bbc_page.input_username VALID_EMAIL
      expect(@bbc_page.find_error_box_ids).to eq nil
    end

  end

end
