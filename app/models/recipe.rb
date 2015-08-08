class Recipe < ActiveRecord::Base

  belongs_to :user
  has_many :recipe_components
  has_many :ingredients, :through => :recipe_components
  has_many :measurements, :through => :recipe_components

end
