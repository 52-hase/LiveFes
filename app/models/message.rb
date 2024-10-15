class Message < ApplicationRecord
  belongs_to :live_room
  belongs_to :user
  has_one_attached :image
  validates :content, presence: true, unless: -> { image.attached? }, length: { maximum: 150 }
end
