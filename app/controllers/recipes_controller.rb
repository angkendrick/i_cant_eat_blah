class RecipesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @ingredient = Ingredient.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
    @measurements = Measurement.all
  end

  def create
    create_recipe_from_json(params)
    create_stage_from_json(params)
  end


end
