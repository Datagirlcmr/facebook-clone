require 'rails_helper'

RSpec.describe User, type: :model do
  context 'User creation' do
    it 'Create a user without name' do
      user = User.new(name: '', birth_date: DateTime.now, gender: 'Male', email: 'mail@mail.com',
                      encrypted_password: 'pass123', password: 'pass123')
      expect(user).not_to be_valid
    end

    it 'Create a user without birth date' do
      user = User.new(name: 'Test', birth_date: nil, gender: 'Male', email: 'mail@mail.com',
                      encrypted_password: 'pass123', password: 'pass123')
      expect(user).not_to be_valid
    end

    it 'Create a user without gender' do
      user = User.new(name: 'Test', birth_date: DateTime.now, gender: '', email: 'mail@mail.com',
                      encrypted_password: 'pass123', password: 'pass123')
      expect(user).not_to be_valid
    end

    it 'Create a user without email' do
      user = User.new(name: 'Test', birth_date: DateTime.now, gender: 'Female', email: '',
                      encrypted_password: 'pass123', password: 'pass123')
      expect(user).not_to be_valid
    end
  end
end
