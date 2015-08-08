class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :long_name
      t.string :short_name
      t.timestamps
    end
    remove_column :recipe_components, :measurement, :string
    add_column :recipe_components, :measurement_id, :integer
  end
end
