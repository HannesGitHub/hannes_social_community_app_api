class UserFollower < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :follower, foreign_key: 'follower_id', class_name: 'User'
end
