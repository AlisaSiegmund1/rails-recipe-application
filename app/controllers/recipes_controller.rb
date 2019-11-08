class RecipesController < ApplicationController
  # before_action :set_recipe, only: [:show]

  def index
    @recipes = Recipe.all
  end

  def show
    set_recipe
    @dose = Dose.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    set_recipe
  end

  def update
    set_recipe
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require('recipe').permit(:name, :description, :photo, :photo_cache)
  end
end
