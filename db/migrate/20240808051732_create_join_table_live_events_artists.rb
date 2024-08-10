class CreateJoinTableLiveEventsArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :live_events_artists, id: false do |t|
      t.bigint :live_event_id, null: false
      t.bigint :artist_id, null: false
    end

    add_index :live_events_artists, :live_event_id
    add_index :live_events_artists, :artist_id
  end
end
