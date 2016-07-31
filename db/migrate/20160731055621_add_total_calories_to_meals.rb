class AddTotalCaloriesToMeals < ActiveRecord::Migration[5.0]
  def change
    add_column :meals, :calorie_total, :integer
  end
end
