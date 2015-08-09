class RecipeComponent < ActiveRecord::Base

  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :measurement
  belongs_to :stage

end
