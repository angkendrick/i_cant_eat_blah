class Recipe < ActiveRecord::Base

  belongs_to :user

  has_many :stages
  has_many :ingredients, :through => :stages
  has_many :measurements, :through => :stages

  has_many :recipe_components
  has_many :ingredients, :through => :recipe_components
  has_many :measurements, :through => :recipe_components

end
