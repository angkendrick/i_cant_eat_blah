class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.integer   :recipe_id
      t.integer   :stage
      t.string    :instructions
      t.timestamps
    end
    remove_column :recipes, :instructions, :string
    add_column    :recipe_components, :stage_id, :integer
  end
end

