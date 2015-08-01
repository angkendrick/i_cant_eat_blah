class MoveMeasurementColumn < ActiveRecord::Migration
  def change

    add_column :recipe_components, :measurement, :string

    remove_column :ingredients, :measurement

  end
end
