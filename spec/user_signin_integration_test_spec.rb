require 'rails_helper'

RSpec.describe 'User signin', type: :feature do
  scenario 'With valid signin data' do
    test_user_signup('1')
    click_on('Logout')
    visit new_user_session_path
    fill_in 'Email', with: 'mail1@mail.com'
    fill_in 'Password', with: 'Pass123'
    click_button 'Log in'
    expect(page).to have_content('Logout')
  end

  scenario 'With invalid signin data' do
    test_user_signup('1')
    click_on('Logout')
    visit new_user_session_path
    fill_in 'Email', with: 'mail@mail.com'
    fill_in 'Password', with: 'Pass'
    click_button 'Log in'
    expect(page).to have_content('Log in')
  end
end
