require 'rails_helper'

RSpec.feature 'StaticPages', type: :feature do
  before { visit '/' }

  describe 'site layout' do
    it 'should have two links' do
      expect(page).to have_link(href: '/', count: 2)
    end

    it 'should have about link' do
      expect(page).to have_link(href: '/about')
    end

    it 'should have help link' do
      expect(page).to have_link(href: '/help')
    end

    it 'should have contact link' do
      expect(page).to have_link(href: '/contact')
    end
  end

  describe 'GET /about' do
    it 'should get about page with the correct title' do
      click_link 'About'
      expect(page).to have_title('About | Lifestyle Articles Website')
    end
  end

  describe 'GET /' do
    it 'should get home pgae with the correct title' do
      visit '/'
      expect(page).to have_title('Home | Lifestyle Articles Website')
    end
  end

  describe 'GET /' do
    it 'should get home pgae with the correct title' do
      click_link 'Home'
      expect(page).to have_title('Home | Lifestyle Articles Website')
    end
  end

  describe 'GET /help' do
    it 'should get help page with the correct title' do
      click_link 'Help'
      expect(page).to have_title('Help | Lifestyle Articles Website')
    end
  end

  describe 'GET /contact' do
    it 'should get contact page with the correct title' do
      click_link 'Contact'
      expect(page).to have_title('Contact | Lifestyle Articles Website')
    end
  end
end
