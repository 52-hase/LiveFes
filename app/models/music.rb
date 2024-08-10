class Music < ApplicationRecord
  belongs_to :artist
  belongs_to :live_event
end
