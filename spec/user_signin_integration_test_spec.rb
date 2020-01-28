require 'rails_helper'

RSpec.describe 'User signin', type: :feature do
  scenario 'With valid signin data' do
    test_user_signup
    click_on('Logout')
    visit new_user_session_path
    fill_in 'Email', with: 'mail@mail.com'
    fill_in 'Password', with: 'Pass123'
    click_button 'Log in'
    expect(page).to have_content('test')
  end

  scenario 'With invalid signin data' do
    test_user_signup
    click_on('Logout')
    visit new_user_session_path
    fill_in 'Email', with: 'mail@mail.com'
    fill_in 'Password', with: 'Pass'
    click_button 'Log in'
    expect(page).to have_content('Log in')
  end

  def test_user_signup
    visit new_user_registration_path
    fill_in 'Name', with: 'Name'
    fill_in 'Birth date', with: DateTime.now
    page.choose('user_gender_male')
    fill_in 'Email', with: 'mail@mail.com'
    fill_in 'Password', with: 'Pass123'
    fill_in 'Password confirmation', with: 'Pass123'
    click_button 'Sign up'
  end
end
