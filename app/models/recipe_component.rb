class RecipeComponent < ActiveRecord::Base

  belongs_to :stage
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :measurement


end
