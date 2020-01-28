require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'Post creation' do
    it 'Create a post without author' do
      post = Post.new(content: 'Content123')
      expect(post).not_to be_valid
    end

    it 'Create a post without content' do
      user = User.create(name: 'Test', birth_date: DateTime.now, gender: 'Female', email: 'test@mail.com',
                         encrypted_password: 'pass123', password: 'pass123')
      post = user.posts.build(content: '')
      expect(post).not_to be_valid
    end

    it 'Create a valid post with content and author' do
      user = User.create(name: 'Test', birth_date: DateTime.now, gender: 'Female', email: 'test@mail.com',
                         encrypted_password: 'pass123', password: 'pass123')
      post = user.posts.build(content: 'Content123')
      expect(post).to be_valid
    end
  end
end
