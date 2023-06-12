class RemoveRecipeIdFromFavorites < ActiveRecord::Migration[7.0]
  def change
    remove_column :favorites, :recipe_id, :integer
  end
end
