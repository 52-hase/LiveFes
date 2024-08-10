class CreateLiveEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :live_events do |t|
      t.string :name
      t.datetime :date

      t.timestamps
    end
  end
end
