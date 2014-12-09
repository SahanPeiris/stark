require 'rails_helper'

RSpec.describe "PageRequest", :type => :request do
  describe "GET /" do
    it "works! (now write some real specs)" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

  describe "Home page" do
    it "should have title 'Home'" do
      visit root_path
      expect(page).to have_title("BitQuora")
    end
  end

  describe "About page" do
    it "should have the content 'About'" do
      visit about_path
      expect(page).to have_content('About')
    end

    it "should have title 'About'" do
      visit about_path
      expect(page).to have_title("BitQuora | About Us")
    end
  end

  describe "Signup page" do
    it "should stay on the same signup page and have the same user count if invalid parameters are given" do
      visit signup_path
      count = User.count
      post users_path, user: { name:  "",
        email: "user@invalid",
        password:              "foo",
        password_confirmation: "bar" }
      expect(count).to eq(User.count)
      assert_template 'users/new'
      end


    it "should go to the user page and have an increased user count if valid parameters are given" do
      get signup_path
      count = User.count + 1
      post_via_redirect users_path, user: { name:  "Sahan Peiris",
        email: "sapeiris@bugatti.com",
        ripple_account: "sapeirs",
        password: "1234foobar",
        password_confirmation: "1234foobar" }
      expect(count).to eq(User.count)
      assert_template 'users/show'
      end

  end

end
