class RenameMatreialColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipes, :matreial, :material
  end
end
