class Measurement < ActiveRecord::Base

  has_many :recipe_components

end
