class RenameColumnInMealCategories < ActiveRecord::Migration[5.0]
  def change
    rename_column :meal_categories, :type, :name
  end
end
