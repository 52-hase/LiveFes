class DropMusicSetLists < ActiveRecord::Migration[7.1]
  def change
    drop_table :music_set_lists, if_exists: true
  end
end
