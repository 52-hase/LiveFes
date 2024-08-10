class Artist < ApplicationRecord
  has_many :live_events_artists
  has_many :live_events, through: :live_events_artists
  has_many :musics, dependent: :destroy
end
