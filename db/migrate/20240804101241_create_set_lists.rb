class CreateSetLists < ActiveRecord::Migration[7.1]
  def change
    create_table :set_lists do |t|
      t.references :live_event, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
