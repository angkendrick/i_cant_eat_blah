class CreateRecipeComponents < ActiveRecord::Migration
  def change
    create_table :recipe_components do |t|
      t.integer   :recipe_id
      t.integer   :ingredient_id
      t.integer   :quantity
      t.timestamps
    end
  end
end
