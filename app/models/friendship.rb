class Friendship < ApplicationRecord
  scope :accepted, -> { where(status: true) }
  scope :unaccepted, -> { where(status: false) }
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates :user, presence: true
  validates :friend, presence: true
end
