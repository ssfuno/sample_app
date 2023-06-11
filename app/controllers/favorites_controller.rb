class FavoritesController < ApplicationController
  def index
  end

  def create
    favorite = current_user.favorites.build(recipe_id: params[:recipe_id])
    
    binding.pry
    
    favorite.save
    render("recipes/show")
  end
  
  def destroy
    favorite = Favorite.find_by(recipe_id: params[:recipe_id], user_id: current_user.id)
    favorite.destroy
    render("recipes/show")
  end
end