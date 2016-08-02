class Meal < ApplicationRecord
  belongs_to :meal_category
  belongs_to :user

  def self.find_meals_by_day(user, date)
    format_date(date)
    user.meals.where(created_at: format_date(date).beginning_of_day..format_date(date).end_of_day)
  end

  def self.format_date(date)
    parsed_date = date["year"] + "-" + date["month"] + "-" + date["day"]
    Date.parse(parsed_date)
  end


end
