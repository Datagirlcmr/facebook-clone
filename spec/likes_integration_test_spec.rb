require 'rails_helper'
require 'test_helper'

RSpec.describe 'Likes', type: :feature do
  scenario 'Like an unliked post' do
    test_user_signup('1')
    test_post_create
    click_button 'Like'
    like_count = find('.like-count').text
    expect(like_count).to eq('1 like')
  end

  scenario 'Like a liked post' do
    test_user_signup('1')
    test_post_create
    click_button 'Like'
    click_button 'Like'
    like_count = find('.like-count').text
    expect(like_count).to eq('0 likes')
  end
end
