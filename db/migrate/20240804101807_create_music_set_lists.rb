class CreateMusicSetLists < ActiveRecord::Migration[7.1]
  def change
    create_table :music_set_lists do |t|
      t.references :set_list, null: false, foreign_key: true
      t.references :music, null: false, foreign_key: true

      t.timestamps
    end
  end
end
