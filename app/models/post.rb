class Post < ApplicationRecord
  belongs_to :user
  belongs_to :user_follower
  validates :title, :message, presence: true

  scope :active, -> { where(is_active: true) }
end