require 'rails_helper'

RSpec.describe 'Comments', type: :feature do
  scenario 'Comment a post' do
    test_user_signup
    test_post_create
    fill_in 'comment_content', with: 'comment123'
    click_button 'comment'
    expect(page).to have_css('.comment-area')
  end
end
