class Recipe < ActiveRecord::Base

  belongs_to :user
  has_many :stages, dependent: :destroy
  has_many :recipe_components, dependent: :destroy
  has_many :ingredients, :through => :stages
  has_many :measurements, :through => :stages

end
