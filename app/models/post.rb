class Post < ApplicationRecord
  belongs_to :user
  validates :title, :message, presence: true

  scope :active, -> { where(is_active: true) }
end