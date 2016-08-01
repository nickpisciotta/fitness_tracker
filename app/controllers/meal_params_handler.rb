class MealParamsHandler < ActiveRecord::Base

  def self.set_meal_attributes(user, params)
    user.meals.create(quantity: params["quantity"],
                      title: params["title"],
                      meal_category_id: params["meal_category_id"])
  end

  def self.set_nutrition_info(user, params)
    user.meals.last.update!(calorie_total:       params["totalCalories"]       ,
                            carbohydrates_total: params["totalCarbohydrates"],
                            protein_total:       params["totalProtein"],
                            fat_total:           params["totalFat"])
  end
end
