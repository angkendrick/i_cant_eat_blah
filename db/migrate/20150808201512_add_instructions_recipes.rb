class AddInstructionsRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :instructions, :string
  end
end
