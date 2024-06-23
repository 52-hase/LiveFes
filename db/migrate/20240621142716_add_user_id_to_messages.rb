class AddUserIdToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :user_id, :bigint
    add_index :messages, :user_id
  end
end
