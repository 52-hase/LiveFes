class AddUserIdToLiveRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :live_rooms, :user_id, :bigint
    add_index :live_rooms, :user_id
  end
end
