require 'rails_helper'
require 'test_helper'

RSpec.describe 'Friendships', type: :feature do
  scenario 'Send a friend request' do
    test_user_signup('1')
    click_on('Logout')
    test_user_signup('2')
    visit users_path
    click_on 'Add friend'
    expect(page).not_to have_content('Add friend')
  end

  scenario 'Accept a friend request' do
    test_user_signup('1')
    click_on('Logout')
    test_user_signup('2')
    visit users_path
    click_on 'Add friend'
    click_on 'Logout'
    test_user_signin('1')
    click_on '1 Friend Request'
    click_on 'Accept friend'
    expect(page).not_to have_content('Accept friend')
  end

  scenario 'User can see friend posts' do
    test_user_signup('1')
    click_on('Logout')
    test_user_signup('2')
    test_post_create
    visit users_path
    click_on 'Add friend'
    click_on('Logout')
    test_user_signin('1')
    click_on '1 Friend Request'
    click_on 'Accept friend'
    visit posts_path
    expect(page).to have_content('by: Name2')
  end

  scenario 'User can not see non-friend posts' do
    test_user_signup('1')
    test_post_create
    click_on('Logout')
    test_user_signup('2')
    visit posts_path
    expect(page).not_to have_content('by: Name1')
  end
end
