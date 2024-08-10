class AddArtistNameToMusics < ActiveRecord::Migration[7.1]
  def change
    add_column :musics, :artist_name, :string
  end
end
