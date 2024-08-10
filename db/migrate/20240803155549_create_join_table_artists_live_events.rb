class CreateJoinTableArtistsLiveEvents < ActiveRecord::Migration[7.1]
  def change
    create_join_table :artists, :live_events do |t|
      # t.index [:artist_id, :live_event_id]
      # t.index [:live_event_id, :artist_id]
    end
  end
end
