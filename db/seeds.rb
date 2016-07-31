class Seed

  def initialize
    create_meal_categories
  end

  def create_meal_categories
    MealCategory.create!(
      name: "Breakfast")
    MealCategory.create!(
      name: "Lunch")
    MealCategory.create!(
      name: "Dinner")
    MealCategory.create!(
      name: "Snack")
  end
end

Seed.new
