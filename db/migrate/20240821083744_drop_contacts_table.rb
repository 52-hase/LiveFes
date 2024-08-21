class DropContactsTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :contacts
  end
end
