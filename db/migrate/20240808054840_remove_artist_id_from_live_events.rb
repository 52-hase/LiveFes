class RemoveArtistIdFromLiveEvents < ActiveRecord::Migration[7.1]
  def change
    remove_column :live_events, :artist_id, :bigint
  end
end
