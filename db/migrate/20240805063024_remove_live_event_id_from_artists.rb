class RemoveLiveEventIdFromArtists < ActiveRecord::Migration[7.1]
  def change
    remove_column :artists, :live_event_id, :bigint
  end
end
