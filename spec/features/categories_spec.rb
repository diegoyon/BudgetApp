require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  before :each do
    @user = User.create(name: 'Diego Yon', email: 'diego@gmail.com', password: 123_456)
    sign_in @user
    visit categories_path
  end

  describe 'categories page' do
    it 'when the user logs in, they are presented with the categories page' do
      expect(page).to have_content('CATEGORIES')
    end

    it 'there is a button to add a new category' do
      expect(page).to have_content('New Category')
    end

    it 'button to add a new category brings the user to the page to create new category' do
      click_link 'New Category'
      expect(page.body).to include('Create Category')
    end

    it 'For each category, the user can see their name, icon and the total amount of all the transactions.' do
      click_link 'New Category'
      fill_in 'category_name', with: 'Games'
      click_button 'Create Category'
      expect(page.body).to include('Games')
      expect(page.body).to include('🎲')
      expect(page.body).to include('$0.00')
    end
  end
end
