class Measurement < ActiveRecord::Base

  has_many :recipe_components

  validates :long_name, presence: true
  validates :short_name, presence: true, uniqueness: true


end
