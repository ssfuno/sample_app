class ChangeDbNames < ActiveRecord::Migration[7.0]
  def change
    rename_table :recipes, :users2
    rename_table :users, :recipes2
  end
end
