class Message < ApplicationRecord
  belongs_to :live_room
  belongs_to :user
  validates :live_room, presence: true
end
