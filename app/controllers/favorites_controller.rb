class FavoritesController < ApplicationController
  before_action :authenticate

  def index
    user = User.find(current_user.id)
    @favorite_recipes = user.favorite_recipes
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    # 自分のレシピはお気に入りに登録できないようにする
    return if Recipe.find_by(id: @recipe.id, user_id: current_user.id)
    
    favorite = current_user.favorites.build(recipe_id: @recipe.id)
    favorite.save
    render turbo_stream: turbo_stream.replace(
      'favorite',
      partial: 'recipes/favorite',
      locals: { recipe: @recipe, liked: true},
    )
  end
  
  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    favorite = Favorite.find_by(recipe_id: @recipe.id, user_id: current_user.id)
    favorite.destroy
    render turbo_stream: turbo_stream.replace(
      'favorite',
      partial: 'recipes/favorite',
      locals: { recipe: @recipe, liked: false },
    )
  end

  private
    def authenticate
      redirect_to root_path unless user_signed_in?
    end
end