class Post < ApplicationRecord
  validates :content, presence: true
  validates :author, presence: true
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
end
