class AddLiveEventIdToArtists < ActiveRecord::Migration[7.1]
  def change
    add_reference :artists, :live_event, foreign_key: true
  end
end
