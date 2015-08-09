class Stage < ActiveRecord::Base

  belongs_to :recipe
  has_many :recipe_components
  has_many :ingredients, :through => :recipe_components
  has_many :measurements, :through => :recipe_components



end
