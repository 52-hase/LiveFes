class LiveEvent < ApplicationRecord
  has_many :live_events_artists
  has_many :artists, through: :live_events_artists
  has_many :musics
  validates :name, presence: true
  validates :date, presence: true
end
