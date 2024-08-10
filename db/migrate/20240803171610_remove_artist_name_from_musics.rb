class RemoveArtistNameFromMusics < ActiveRecord::Migration[7.1]
  def change
    remove_column :musics, :artist_name, :string
  end
end
