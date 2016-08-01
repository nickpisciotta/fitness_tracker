class AddColumnsToMeals < ActiveRecord::Migration[5.0]
  def change
    add_column :meals, :protein_total, :integer
    add_column :meals, :fat_total, :integer
    add_column :meals, :carbohydrates_total, :integer

    add_reference :meals, :user, index: true, foreign_key: true
    add_reference :meals, :meal_category, index: true, foreign_key: true
  end
end
