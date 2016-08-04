require 'rails_helper'

RSpec.describe MealParamsHandler do
  context "#set_meal_attributes" do
    it "creates new meal with attributes" do
      user = user_create
      create_meal_categories
      params = {"totalCalories"=>"29", "totalCarbohydrates"=>"7", "totalProtein"=>"0", "totalFat"=>"1", "title"=>"large carrot", "quantity"=>"1", "category"=>"Breakfast"}

      expect(user.meals.count).to eq(0)

      mp = MealParamsHandler.set_meal_attributes(user, params)

      expect(user.meals.count).to eq(1)
      expect(user.meals.first.calorie_total).to eq(29)
    end
  end
end
