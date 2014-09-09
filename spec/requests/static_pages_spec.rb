require 'rails_helper'

RSpec.describe "StaticPages", :type => :request do
  describe "GET /static_pages" do
    it "works! (now write some real specs)" do
      get static_pages_home_path
      expect(response).to have_http_status(200)
    end
  end

  describe "Home page" do
    it "should have the content 'The platform to measure social good'" do
      visit '/static_pages/home'
      expect(page).to have_content('The platform to measure social good')
    end

    it "should have title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("CivilizationR | Home")
    end
  end

  describe "About page" do
    it "should have the content 'About'" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end

    it "should have title 'About'" do
      visit '/static_pages/about'
      expect(page).to have_title("CivilizationR | About Us")
    end
  end
end
