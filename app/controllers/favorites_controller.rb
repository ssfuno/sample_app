class FavoritesController < ApplicationController
  before_action :authenticate

  def index
    user = User.find_by(id: params[:user_id])
    @favorite_recipes = user.favorite_recipes
  end

  def create
    # 自分のレシピはお気に入りに登録できないようにする
    return if Recipe.find_by(id: params[:recipe_id], user_id: current_user.id)
    favorite = current_user.favorites.build(recipe_id: params[:recipe_id])
    favorite.save
    # redirect_to recipe_path(params[:recipe_id])
  end
  
  def destroy
    favorite = Favorite.find_by(recipe_id: params[:recipe_id], user_id: current_user.id)
    favorite.destroy
    # redirect_to recipe_path(params[:recipe_id])
  end

  private
    def authenticate
      redirect_to root_path unless user_signed_in?
    end
end