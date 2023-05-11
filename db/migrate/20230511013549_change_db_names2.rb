class ChangeDbNames2 < ActiveRecord::Migration[7.0]
  def change
    rename_table :recipes2, :recipes
    rename_table :users2, :users
  end
end
