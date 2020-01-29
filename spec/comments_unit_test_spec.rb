require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Comment creation' do
    it 'Create a comment without author, and post' do
      comment = Comment.new(content: 'Content123')
      expect(comment).not_to be_valid
    end

    it 'Create a comment without content, and post' do
      user = User.create(name: 'Test', birth_date: DateTime.now, gender: 'Female', email: 'test@mail.com',
                          encrypted_password: 'pass123', password: 'pass123')
      comment = user.comments.build(content: '')
      expect(comment).not_to be_valid
    end

    it 'Create a comment without content, and author' do
      user = User.create(name: 'Test', birth_date: DateTime.now, gender: 'Female', email: 'test@mail.com',
                          encrypted_password: 'pass123', password: 'pass123')
      post = user.posts.create(content: 'content101')
      comment = post.comments.build(content: '')
      expect(comment).not_to be_valid
    end

    it 'Create a valid comment with content, post and author' do
      user = User.create(name: 'Test', birth_date: DateTime.now, gender: 'Female', email: 'test@mail.com',
                          encrypted_password: 'pass123', password: 'pass123')
      post = user.posts.create(content: 'content101')
      comment = post.comments.build(content: 'content101', author_id: user.id)
      expect(comment).to be_valid
    end
  end
end