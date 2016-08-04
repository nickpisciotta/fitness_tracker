require 'rails_helper'

RSpec.describe Meal, type: :model do
  # context "#find_meals_by_day" do
  #   it "finds meals by the day" do
  #     date = "08/02/2016"
  #     user = create(:user)
  #     meal1 = create(:meal, user: user)
  #     meal2 = create(:meal, user: user)
  #     meal3 = create(:meal, user: user)
  #     meal4 = create(:meal, created_at: Date.today.prev_day)
  #
  #     byebug
  #   end
  # end

  context "#calorie_sum" do
    it "calculates total calories" do
      user = create(:user)
      meal1 = create(:meal, user: user)
      meal2 = create(:meal, user: user)
      meal3 = create(:meal, user: user)

      expected_total_calories = user.meals.sum(:calorie_total)
      calculated_total_calories = user.meals.calorie_sum

      expect(expected_total_calories).to eq(calculated_total_calories)
    end
  end
  context "#protein_sum" do
    it "calculates total protein" do
      user = create(:user)
      meal1 = create(:meal, user: user)
      meal2 = create(:meal, user: user)
      meal3 = create(:meal, user: user)

      expected_total_protein = user.meals.sum(:protein_total)
      calculated_total_protein = user.meals.protein_sum

      expect(expected_total_protein).to eq(calculated_total_protein)
    end
  end

  context "#carbohydrate_sum" do
    it "calculates total carbohydrates" do
      user = create(:user)
      meal1 = create(:meal, user: user)
      meal2 = create(:meal, user: user)
      meal3 = create(:meal, user: user)

      expected_total_carbohydrates = user.meals.sum(:carbohydrates_total)
      calculated_total_carbohydrates = user.meals.carbohyrate_sum

      expect(expected_total_carbohydrates).to eq(calculated_total_carbohydrates)
    end
  end

  context "#fat_sum" do
    it "calculates total fat" do
      user = create(:user)
      meal1 = create(:meal, user: user)
      meal2 = create(:meal, user: user)
      meal3 = create(:meal, user: user)

      expected_total_fat = user.meals.sum(:fat_total)
      calculated_total_fat = user.meals.fat_sum

      expect(expected_total_fat).to eq(calculated_total_fat)
    end
  end


end
