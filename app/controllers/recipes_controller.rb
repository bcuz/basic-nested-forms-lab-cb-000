class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build()
    @recipe.ingredients.build()
  end

  def create
    binding.pry
    @recipe = Recipe.create(recipe_params)
    # redirect_to recipe_path
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end

  end

  def recipe_params
    params.require(:recipe).permit(:title)
  end
end
