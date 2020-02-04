class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: %i[facebook]
  validates :name, presence: true
  validates :gender, presence: true
  validates :birth_date, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :friendships
  has_many :accepted_friendships, -> { accepted }, class_name: 'Friendship'
  has_many :unaccepted_friendships, -> { unaccepted }, class_name: 'Friendship'
  has_many :friends, through: :accepted_friendships
  has_many :received_requests, -> { unaccepted }, foreign_key: :friend_id, class_name: 'Friendship'
  has_many :received_requests_users, through: :received_requests, source: :user
  has_many :sent_requests, through: :unaccepted_friendships, source: :friend

  def friend?(user)
    friends.include?(user)
  end

  def request_sent?(user)
    (received_requests_users + sent_requests).include?(user)
  end

  def self.from_omniauth(auth)
    user = find_by(email: auth.info.email)
    user || User.create(name: auth.info.name, password: Devise.friendly_token[0, 20],
                        email: auth.info.email, birth_date: DateTime.now, gender: 'non-binary')
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data == session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end
end
