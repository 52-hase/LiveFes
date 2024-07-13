class RemoveAvatarFromUsers < ActiveRecord::Migration[7.1]
  def up
    remove_column :users, :avatar
  end

  def down
    add_column :users, :avatar, :string
  end
end