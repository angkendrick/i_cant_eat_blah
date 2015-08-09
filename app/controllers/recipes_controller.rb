class RecipesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
    @measurements = Measurement.all
  end

  def create
    create_recipe_from_json(params)
    create_stage_from_json(params)
    @recipe = Recipe.last
    render json: @recipe, notice: "#{@recipe.name} added!"
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    if @recipe.destroy
      redirect_to recipes_path, notice: "#{@recipe.name} deleted!"
    else
      render :index
    end
  end

end
