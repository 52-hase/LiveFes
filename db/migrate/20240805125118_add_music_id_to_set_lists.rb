class AddMusicIdToSetLists < ActiveRecord::Migration[7.1]
  def change
    add_column :set_lists, :music_id, :bigint
    add_index :set_lists, :music_id
  end
end
