class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  validates :gender, presence: true
  validates :birth_date, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :friendships
  has_many :inverse_friendships, foreign_key: 'friend_id', class_name: 'Friendship'

  def friends
    friends = []
    friendships.each do |friendship|
      friends.push(friendship.friend) if friendship.status
    end
    inverse_friendships.each do |friendship|
      friends.push(friendship.user) if friendship.status
    end
    friends
  end

  def requests
    requests = []
    inverse_friendships.each do |friendship|
      requests.push(friendship) unless friendship.status
    end
    requests
  end

  def requesters
    friends = []
    friendships.each do |friendship|
      friends.push(friendship.friend) unless friendship.status
    end
    inverse_friendships.each do |friendship|
      friends.push(friendship.user) unless friendship.status
    end
    friends
  end

  def is_friend?(user)
    friends.include?(user)
  end

  def request_sent?(user)
    requesters.include?(user)
  end
end
