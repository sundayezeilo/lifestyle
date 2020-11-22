require 'rails_helper'

RSpec.feature 'Articles', type: :feature do
  let(:user) { FactoryBot.build(:user) }
  before do
    Category.create!(name: 'electric vehicles', priority: 1)
    Category.create!(name: 'arduino', priority: 2)
    Category.create!(name: 'machine learning', priority: 3)
    Category.create!(name: 'embedded linux', priority: 4)
    Category.create!(name: 'sensors', priority: 5)

    user.save
    visit '/'
    click_link 'Log in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'New article'
    fill_in 'Title', with: 'Sample Article'
    fill_in 'Text', with: 'Sample article body'
  end

  describe 'new article' do
    context 'without selecting at least one category' do
      it 'should not be successful' do
        click_button 'Create'
        expect(page).to have_selector('div.alert.alert-danger', text: "Categories can't be blank")
      end
    end

    context 'with all valid fields' do
      before do
        check('Arduino')
        click_button 'Create'
      end

      it 'should create a new article' do
        expect(page).to have_selector('div.alert.alert-success', text: 'New article was successfully created.')
      end

      it 'redirects to categories page' do
        expect(current_path).to eq(categories_path)
        expect(page).to have_current_path(categories_path)
      end
    end

    context 'with multiple categories checked' do
      before do
        check('Arduino')
        check('Sensors')
        check('Electric Vehicles')

        click_button 'Create'
      end

      it 'should create a new article' do
        expect(page).to have_selector('div.alert.alert-success', text: 'New article was successfully created.')
      end

      it 'redirects to categories page' do
        expect(current_path).to eq(categories_path)
        expect(page).to have_current_path(categories_path)
      end
    end
  end

  describe 'articles index' do
    before do
      check('Arduino')
      check('Sensors')
      check('Electric Vehicles')

      click_button 'Create'
    end

    it 'should render the correct articles page' do
      click_link 'arduino'
      expect(page).to have_current_path("/articles?category_id=#{Category.find_by(name: 'arduino').id}")
    end

    it 'should render the correct articles page' do
      click_link 'sensors'
      expect(page).to have_current_path("/articles?category_id=#{Category.find_by(name: 'sensors').id}")
    end

    it 'should render the correct articles page' do
      click_link 'electric vehicles'
      expect(page).to have_current_path("/articles?category_id=#{Category.find_by(name: 'electric vehicles').id}")
    end
  end

  describe 'article votes' do
    before do
      check('Arduino')
      check('Sensors')
      check('Electric Vehicles')

      click_button 'Create'
    end

    it 'should have a vote' do
      click_link 'arduino'
      expect { first('a.vote-up').click }.to change { Vote.count }.by(1)
      expect { first('a.vote-down').click }.to change { Vote.count }.by(-1)
    end
  end
end
