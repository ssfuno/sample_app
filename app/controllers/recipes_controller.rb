class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    @recipe.save
    redirect_to root_path
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end

  private
    def recipe_params
      params.require(:recipe).permit(:photo, :title, :material, :process, :cooking_minute)
    end
end
