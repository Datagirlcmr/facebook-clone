def test_user_signup(id)
  visit new_user_registration_path
  fill_in 'Name', with: "Name#{id}"
  fill_in 'Birth date', with: DateTime.now
  page.choose('user_gender_male')
  fill_in 'Email', with: "mail#{id}@mail.com"
  fill_in 'Password', with: 'Pass123'
  fill_in 'Password confirmation', with: 'Pass123'
  click_button 'Sign up'
end

def test_user_signin(id)
  visit new_user_session_path
  fill_in 'Email', with: "mail#{id}@mail.com"
  fill_in 'Password', with: 'Pass123'
  click_button 'Log in'
end

def test_post_create
  click_on 'Create new post'
  fill_in 'post_content', with: 'Content123'
  click_button 'Post'
end
