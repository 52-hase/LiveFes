class LiveEventsArtist < ApplicationRecord
  belongs_to :live_event
  belongs_to :artist
end
