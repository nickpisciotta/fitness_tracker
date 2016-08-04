class MealParamsHandler < ActiveRecord::Base

  def self.set_meal_attributes(user, params)
    user.meals.create(quantity: params["quantity"],
                      title: params["title"],
                      meal_category_id: find_meal_category_id(params["category"]),
                      calorie_total: params["totalCalories"].to_i * params["quantity"].to_i,
                      carbohydrates_total: params["totalCarbohydrates"].to_i  * params["quantity"].to_i,
                      protein_total:       params["totalProtein"].to_i * params["quantity"].to_i,
                      fat_total:           params["totalFat"].to_i * params["quantity"].to_i
                      )
  end

  def self.find_meal_category_id(params)
    MealCategory.find_by(name: params).id
  end

end
