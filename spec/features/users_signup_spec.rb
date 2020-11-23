require 'rails_helper'

RSpec.feature 'UsersSignups', type: :feature do
  before do
    visit '/users/sign_up'
    fill_in 'Name', with: 'Example User'
    fill_in 'Email', with: nil
    fill_in 'Password', with: 'foobar'
  end

  describe 'Signup failure' do
    context 'form' do
      it 'should have a name field' do
        expect(page).to have_field('Name')
      end

      it 'should have an email field' do
        expect(page).to have_field('Email')
      end

      it 'should have a password field' do
        expect(page).to have_field('Password')
      end
    end

    context 'failiure' do
      it 'should display failiure message' do
        click_button 'Create account'
        expect(page).to have_text("Email can't be blank")
      end

      it 'should display failiure message' do
        click_button 'Create account'
        expect(page).to have_text("Email can't be blank")
      end
    end
  end

  describe 'Signup success' do
    before do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Confirmation', with: 'foobar'
    end

    it 'Creates a new user' do
      expect { click_button 'Create account' }.to change { User.count }.by(1)
    end

    it 'should display success message' do
      click_button 'Create account'
      expect(page).to have_text('Welcome! You have signed up successfully.')
    end
  end
end
