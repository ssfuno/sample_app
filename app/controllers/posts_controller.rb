class PostsController < ApplicationController
  def index
    @recipes = Recipe.all
  end
  def show
  end
  def new
    @recipe = Recipe.new
  end
  def create
    @recipe = Recipe.create(task_params)
    redirect_to root_path
  end
  def edit
  end
  def update
  end
  def destroy
  end

  private
    def task_params
      params.require(:recipe).permit(:photo, :title, :material, :process, :cooking_minute)
    end
end
