class RemoveColumnFromMeal < ActiveRecord::Migration[5.0]
  def change
    remove_column :meals, :meal_category_id
  end
end
