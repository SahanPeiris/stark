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
end
