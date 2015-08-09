class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # {"recipe_name"=>"shrimp", "stage1"=>"catch shrimp", "stage1_1_ingredients"=>"2", "stage1_1_quantity"=>"10",
  # "stage1_1_measurements"=>"1", "stage1_2_ingredients"=>"3", "stage1_2_quantity"=>"11", "stage1_2_measurements"=>"8",
  # "stage2"=>"cook shrimp", "stage2_1_ingredients"=>"6", "stage2_1_quantity"=>"13", "stage2_1_measurements"=>"12",
  # "stage2_2_ingredients"=>"7", "stage2_2_quantity"=>"14", "stage2_2_measurements"=>"11"}



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
      stage.save #has stage_id

      dynamic_count = 1
      10.times do
        continue = true
        rc = RecipeComponent.new
        rc.recipe_id = @recipe.id
        rc.stage_id = stage.id
        puts json.has_key?("stage#{stage_count}_#{dynamic_count}_ingredients") ? rc.ingredient_id = json["stage#{stage_count}_#{dynamic_count}_ingredients"] : continue = false
        puts json.has_key?("stage#{stage_count}_#{dynamic_count}_measurements") ? rc.measurement_id = json["stage#{stage_count}_#{dynamic_count}_measurements"] : continue = false
        puts json.has_key?("stage#{stage_count}_#{dynamic_count}_quantity") ? rc.quantity = json["stage#{stage_count}_#{dynamic_count}_quantity"] : continue = false
        rc.save if continue
        dynamic_count += 1
      end

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
