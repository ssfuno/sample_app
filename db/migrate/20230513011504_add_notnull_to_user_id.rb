class AddNotnullToUserId < ActiveRecord::Migration[7.0]
  def change
    change_column_null :recipes, :user_id, false
  end
end
