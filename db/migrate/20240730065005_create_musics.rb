class CreateMusics < ActiveRecord::Migration[7.1]
  def change
    create_table :musics do |t|
      t.string :name
      t.string :artist_name
      t.string :spotify_track_id

      t.timestamps
    end
  end
end
