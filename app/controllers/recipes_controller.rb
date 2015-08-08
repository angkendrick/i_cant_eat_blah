class RecipesController < ApplicationController

  def index
    @ingredient = Ingredient.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
    @measurements = Measurement.all
  end

  def create

  end

end
