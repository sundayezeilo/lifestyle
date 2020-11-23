require 'rails_helper'

RSpec.feature 'UsersLogins', type: :feature do
  describe 'signin page' do
    before { visit '/users/sign_in' }

    it 'should have a heading sign in' do
      expect(page).to have_selector('h1', text: 'Log in')
    end

    it 'should have a sign in button' do
      expect(page).to have_button('Log in')
    end
  end

  describe 'signin' do
    let(:user) { FactoryBot.build(:user) }
    before do
      user.save
      visit '/users/sign_in'
    end

    context 'with invalid information' do
      before { click_button 'Log in' }

      it 'should have a title' do
        expect(page).to have_title('Log in | Lifestyle Articles Website')
      end

      it 'should display error message' do
        expect(page).to have_selector('div.alert.alert', text: 'Invalid Email or password.')
      end

      it 'should not display home page' do
        expect(page).to_not have_link(root_path)
      end
    end

    context 'with valid information' do
      before do
        fill_in 'Email', with: user.email.upcase
        fill_in 'Password', with: user.password
        click_button 'Log in'
      end

      it 'should display login success message' do
        expect(page).to have_selector('div.alert.alert-success', text: 'Signed in successfully.')
      end

      it 'should render home page' do
        expect(page).to have_current_path(root_path)
      end

      it 'shows home page with the correct title title' do
        expect(page).to have_title('Home | Lifestyle Articles Website')
      end
    end

    context 'with valid information followed by logout' do
      before do
        fill_in 'Email', with: user.email.upcase
        fill_in 'Password', with: user.password
        click_button 'Log in'
      end

      it 'redirects to root path' do
        click_link 'Log out'
        expect(page).to have_current_path(root_path)
        expect(current_path).to eq(root_path)
      end

      it 'page should have s sign in button' do
        click_link 'Log out'
        expect(page).to have_link('Log in')
      end
    end
  end
end
