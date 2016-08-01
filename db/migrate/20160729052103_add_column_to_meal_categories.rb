class AddColumnToMealCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :meal_categories, :type, :string
  end
end
