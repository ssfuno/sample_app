class RecipesController < ApplicationController
  before_action :authenticate, only: [:new, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
    @recipes = Recipe.where("title LIKE?", "%#{params[:keyword]}%") if params[:keyword]
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render("recipes/new", status: :unprocessable_entity)
    end
  end
  
  def edit
    @recipe  = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to root_path
    else
      render("recipes/edit")
    end
  end
  
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to root_path, status: :see_other
  end

  private
    def recipe_params
      params.require(:recipe).permit(:photo, :title, :material, :process, :cooking_minute)
    end

    def authenticate
      redirect_to root_path unless user_signed_in?
    end
end
