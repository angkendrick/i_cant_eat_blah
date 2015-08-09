class Ingredient < ActiveRecord::Base

  #has_many :recipe_components

  validates :name, presence: true
  validates :name, uniqueness: true

end
