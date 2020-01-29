require 'rails_helper'

RSpec.describe 'User signup', type: :feature do
  scenario 'With valid signup data' do
    visit new_user_registration_path
    fill_in 'Name', with: 'Name'
    fill_in 'Birth date', with: DateTime.now
    page.choose('user_gender_male')
    fill_in 'Email', with: 'mail@mail.com'
    fill_in 'Password', with: 'Pass123'
    fill_in 'Password confirmation', with: 'Pass123'
    click_button 'Sign up'
    expect(page).to have_content('Logout')
  end

  scenario 'With invalid signup data' do
    visit new_user_registration_path
    fill_in 'Name', with: ''
    fill_in 'Birth date', with: DateTime.now
    fill_in 'Email', with: 'mail@mail.com'
    fill_in 'Password', with: 'Pass123'
    fill_in 'Password confirmation', with: 'Pass123'
    click_button 'Sign up'
    expect(page).to have_content('Sign up')
  end
end
