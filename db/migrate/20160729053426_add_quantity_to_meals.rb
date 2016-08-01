class AddQuantityToMeals < ActiveRecord::Migration[5.0]
  def change
    add_column :meals, :quantity, :integer
  end
end
