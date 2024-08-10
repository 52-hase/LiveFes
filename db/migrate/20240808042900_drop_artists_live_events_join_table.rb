class DropArtistsLiveEventsJoinTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :artists_live_events
  end

  def down
    create_table :artists_live_events, id: false do |t|
      t.bigint :artist_id, null: false
      t.bigint :live_event_id, null: false
      t.index :artist_id
      t.index :live_event_id
    end
  end
end
