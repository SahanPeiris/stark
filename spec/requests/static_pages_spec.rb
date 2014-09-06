require 'rails_helper'

RSpec.describe "StaticPages", :type => :request do
  describe "GET /static_pages" do
    it "works! (now write some real specs)" do
      get static_pages_home_path
      expect(response).to have_http_status(200)
    end
  end

  describe "Home page" do
    it "should have the content 'Social Good Meter'" do
      visit '/static_pages/home'
      expect(page).to have_content('Social Good Meter')
    end
  end

  describe "About page" do
    it "should have the content 'Help'" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end
  end
end
