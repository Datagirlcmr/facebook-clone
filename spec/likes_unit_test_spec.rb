require 'rails_helper'

RSpec.describe Like, type: :model do
    context 'Like modelling' do
      it 'Create like without author' do
        user = User.create(name: 'Test', birth_date: DateTime.now, gender: 'Female', email: 'test@mail.com',
                           encrypted_password: 'pass123', password: 'pass123')
        post = user.posts.create(content: 'heylo')
        like = post.likes.build(author: nil)
        expect(like).not_to be_valid
      end
  
      it 'Create a like without post' do
        user = User.create(name: 'Test', birth_date: DateTime.now, gender: 'Female', email: 'test@mail.com',
                           encrypted_password: 'pass123', password: 'pass123')
        like = user.likes.build(post: nil)
        expect(like).not_to be_valid
      end
  
      it 'Create a valid like with post and author' do
        user = User.create(name: 'Test', birth_date: DateTime.now, gender: 'Female', email: 'test@mail.com',
                           encrypted_password: 'pass123', password: 'pass123')
        post = user.posts.create(content: 'heylo')
        like = post.likes.create(author: user)
        expect(post).to be_valid
      end
    end
  end