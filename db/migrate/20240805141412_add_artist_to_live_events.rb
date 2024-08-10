class AddArtistToLiveEvents < ActiveRecord::Migration[7.1]
  def change
    add_reference :live_events, :artist, foreign_key: true, null: true # nullを許可する
  end
end
