require 'rails_helper'

RSpec.feature 'UserSignIns', type: :feature do
  describe 'splash page' do
    it 'shows the log in button' do
      visit root_path
      expect(page).to have_content('LOG IN')
    end

    it 'shows the sign up button' do
      visit root_path
      expect(page).to have_content('SIGN UP')
    end

    it 'shows the logo' do
      visit root_path
      parent = page.find('div.splash-screen')
      expect(parent).to have_css('.logo-img')
    end
  end

  describe 'user sign in' do
    it 'sign ins succesfully' do
      @user = User.create(name: 'Diego Yon', email: 'diego@gmail.com', password: 123_456)
      visit new_user_session_path

      fill_in 'user_email', with: 'diego@gmail.com'
      fill_in 'user_password', with: 123_456

      click_button 'Log In'
      expect(page).to have_content 'CATEGORIES'
    end
  end
end
