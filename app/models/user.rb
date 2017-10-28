require 'securerandom'
include ActionController::HttpAuthentication::Basic::ControllerMethods
class User < ApplicationRecord
  has_many :posts
  scope :active, -> { where(is_active: true) }

  validates :name, :username, :password, presence: true
  before_create :generate_auth_token

  has_many :following, foreign_key: 'user_id', class_name: 'UserFollower'
  has_many :followers, foreign_key: 'follower_id', class_name: 'UserFollower'

  has_secure_password

  private
  def generate_auth_token
    begin
      self.auth_token = SecureRandom.hex
    end while self.class.exists?(auth_token: auth_token)
  end

end