class DropSetListsTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :set_lists
  end

  def down
    create_table :set_lists do |t|
      t.references :live_event, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true
      t.references :music, foreign_key: true
      t.timestamps
    end
  end
end
