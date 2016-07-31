class CreateMealCategoriesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :meal_categories do |t|
      t.string :type

      t.timestamps null: false
    end
  end
end
