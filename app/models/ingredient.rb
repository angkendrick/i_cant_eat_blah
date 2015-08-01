class Ingredient < ActiveRecord::Base

  #attr_accessor :name

  validates :name, presence: true
  validates :name, uniqueness: true

end
