class ModifyColumnLength < ActiveRecord::Migration
  def change
    change_column :stages, :instructions, :string, :limit => 10000
  end
end
