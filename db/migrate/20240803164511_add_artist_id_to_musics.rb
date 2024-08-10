class AddArtistIdToMusics < ActiveRecord::Migration[7.1]
  def change
    add_reference :musics, :artist, foreign_key: true
  end
end
