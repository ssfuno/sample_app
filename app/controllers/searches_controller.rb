class SearchesController < ApplicationController
  def index
    binding.pry
    @recipes = Recipe.where("title LIKE?", "%#{params[:keyword]}%")
  end
end
