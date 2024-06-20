class CreateLiveRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :live_rooms do |t|
      t.string :name

      t.timestamps
    end
  end
end
