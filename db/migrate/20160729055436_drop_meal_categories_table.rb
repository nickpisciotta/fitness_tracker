class DropMealCategoriesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :meal_categories
  end
end
