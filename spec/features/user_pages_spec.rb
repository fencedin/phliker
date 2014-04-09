require 'spec_helper'


describe User do

  context 'Login button fail' do
    it 'gives error when credentials dont match' do
      user1 = FactoryGirl.create :user_info
      visit photos_path
      fill_in 'Name', with: user1.name
      click_button 'Log In'
      page.should have_content 'Name or password is invalid!'
    end
    it 'logs user in when clicked' do
      user1 = FactoryGirl.create :user_info
      visit photos_path
      fill_in 'Name', with: user1.name
      fill_in 'Password', with: 1
      click_button 'Log In'
      page.should have_content 'Logged in successfully!'
    end
  end
  context 'sign up page' do
    it 'gives error if fields are not filled in' do
      visit signup_path
      within("#create") do
        fill_in 'Name', with: "nameaidh"
        click_button 'Sign Up'
      end
      page.should have_content 'Form is invalid'
    end

    it 'gives creates a user and logs them in if all fields are enterted correctly' do
      visit signup_path
      within("#create") do
        fill_in 'Name', with: "nameaidh"
        fill_in 'Password', with: '1'
        fill_in 'Password confirmation', with: '1'
        click_button 'Sign Up'
      end
      page.should have_content 'Logged in as nameaidh.'
    end
  end

end
