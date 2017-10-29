class Post < ApplicationRecord
  belongs_to :user
  attr_accessor :creator_name

  validates :title, :message, presence: true

  scope :active, -> { where(is_active: true) }
end