describe BBCSite do

  context "homepage" do

    before :all do
      @bbc_page = BBCSite.new.bbc_homepage
      @bbc_page.visit_homepage
    end

    it "should correctly navigate from the homepage to the signin page via the navigation bar" do
      @bbc_page.click_sign_in_link
      expect(@bbc_page.get_url).to eq "https://account.bbc.com/signin"
    end

  end

end
