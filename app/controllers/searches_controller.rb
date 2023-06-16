class SearchesController < ApplicationController
  def index
    @recipes = Recipe.where("title LIKE?", "%#{params[:keyword]}%")
  end
end
