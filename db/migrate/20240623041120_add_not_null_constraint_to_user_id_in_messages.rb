class AddNotNullConstraintToUserIdInMessages < ActiveRecord::Migration[7.1]
  def change
    change_column_null :messages, :user_id, false
  end
end
