class AddReferenceToMeals < ActiveRecord::Migration[5.0]
  def change
    add_reference :meals, :meal_category, index: true, foreign_key: true
  end
end
