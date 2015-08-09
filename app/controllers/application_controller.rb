class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # {"recipe_name"=>"Shrimp", "stage1"=>"catch shrimp", "stage1_ingredients1"=>"1", "stage1_quantity1"=>"1",
  # "stage1_measurements1"=>"3", "stage1_ingredients2"=>"2", "stage1_quantity2"=>"2", "stage1_measurements2"=>"4",
  # "stage2"=>"heat pan", "stage2_ingredients1"=>"3", "stage2_quantity1"=>"3", "stage2_measurements1"=>"2",
  # "stage3"=>"cook shrimp", "stage3_ingredients1"=>"4", "stage3_quantity1"=>"4", "stage3_measurements1"=>"6",
  # "stage3_ingredients2"=>"6", "stage3_quantity2"=>"6", "stage3_measurements2"=>"12", "stage3_ingredients3"=>"6",
  # "stage3_quantity3"=>"13", "stage3_measurements3"=>"11"}


  def create_recipe_from_json(json)
    @recipe = Recipe.new
    @recipe.user_id = current_user.id
    @recipe.name = json['recipe_name']
    @recipe.save #now has recipe_id
  end

  def create_stage_from_json(json)
    count = 1
    10.times {count += 1 if json.has_key?("stage#{count}")}

    stage_count = 1
    (count - 1).times do
      stage = Stage.new
      stage.recipe_id = @recipe.id
      stage.stage = stage_count
      stage.instructions = json["stage#{stage_count}"]
      stage.save
      stage_count += 1
    end
  end

  protected

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
  helper :users

end
