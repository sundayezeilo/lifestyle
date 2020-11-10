require 'rails_helper'

RSpec.feature "StaticPages", type: :feature do
  describe "GET /about" do
    it 'should get about page with the correct title' do
      visit "/static_pages/about"
      expect(page).to have_title('About | Lifestyle Articles Website')
    end
  end

  describe "GET /home" do
    it 'should get home pgae with the correct title' do
      visit "/static_pages/home"
      expect(page).to have_title('Home | Lifestyle Articles Website')
    end
  end

  describe "GET /help" do
    it 'should get help page with the correct title' do
      visit "/static_pages/help"
      expect(page).to have_title('Help | Lifestyle Articles Website')
    end
  end
end
