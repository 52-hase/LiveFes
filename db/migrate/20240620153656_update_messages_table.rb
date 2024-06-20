class UpdateMessagesTable < ActiveRecord::Migration[7.1]
  def change
    change_table :messages do |t|
      t.change :content, :text
      t.references :live_room, null: false, foreign_key: true
    end
  end
end
