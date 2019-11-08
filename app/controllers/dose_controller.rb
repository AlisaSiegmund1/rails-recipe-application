class DosesController < ApplicationController
  def new
    @dose = Recipe.find(params[:recipe_id])
    @recipe = Recipe.new
  end

  def create
    dose = Dose.new(dose_params)
    recipe = Recipe.find(params[:recipe_id])
    ingredient = Ingredient.find(params[:dose][:ingredient_id])
    dose.recipe = recipe
    dose.ingredient = ingredient
    dose.save!
    redirect_to recipe_path(recipe)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to recipe_path(@dose.recipe)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
