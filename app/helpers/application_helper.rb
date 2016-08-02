module ApplicationHelper

  def todays_meals(user)
    meals = user.meals.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end
end
