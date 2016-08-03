class MealParamsHandler < ActiveRecord::Base

  def self.set_meal_attributes(user, params)
    user.meals.create(quantity: params["quantity"],
                      title: params["title"],
                      meal_category_id: find_meal_category_id(params["category"]),
                      calorie_total: params["totalCalories"],
                      carbohydrates_total: params["totalCarbohydrates"],
                      protein_total:       params["totalProtein"],
                      fat_total:           params["totalFat"]
                      )
  end

  def self.find_meal_category_id(params)
    MealCategory.find_by(name: params).id
  end

end
