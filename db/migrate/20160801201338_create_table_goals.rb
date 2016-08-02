class CreateTableGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.integer :total_steps
      t.integer :total_calories_burned
      t.integer :total_calories
      t.integer :total_protein
      t.integer :total_carbohydrates
      t.integer :total_fat
    end
  end
end
