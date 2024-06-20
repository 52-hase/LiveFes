class Message < ApplicationRecord
  belongs_to :live_room
  validates :live_room, presence: true
end
