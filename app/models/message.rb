class Message < ApplicationRecord
  belongs_to :live_room
  belongs_to :user
  validates :live_room, presence: true
  validates :content, presence: true
  validates :content, presence: true, length: { maximum: 100 }
end