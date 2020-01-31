require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'Friendship creation' do
    it 'Create a friendship without user' do
      friendship = Friendship.new(friend_id: 1)
      expect(friendship).not_to be_valid
    end

    it 'Create a friendship without friend' do
      friendship = Friendship.new(user_id: 1)
      expect(friendship).not_to be_valid
    end

    it 'Create a valid friendship' do
      user1 = User.create(name: 'Test', birth_date: DateTime.now, gender: 'Female', email: 'test@mail.com',
                          encrypted_password: 'pass123', password: 'pass123')
      user2 = User.create(name: 'Test', birth_date: DateTime.now, gender: 'Female', email: 'test2@mail.com',
                          encrypted_password: 'pass123', password: 'pass123')
      friendship = user1.friendships.build(friend: user2)
      expect(friendship).to be_valid
    end
  end
end
