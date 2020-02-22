class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  validates :author, presence: true
  validates :post, presence: true
end
