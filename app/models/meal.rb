class Meal < ApplicationRecord
  belongs_to :meal_category
  belongs_to :user

  def self.find_meals_by_day(user, date)
    parse_date(date)
    user.meals.where(created_at: parse_date(date).beginning_of_day..parse_date(date).end_of_day)
  end

  def self.parse_date(date)
    Date.parse(date)
  end

  def self.calorie_sum
    sum(:calorie_total)
  end

  def self.protein_sum
    sum(:protein_total)
  end

  def self.carbohyrate_sum
    sum(:carbohydrates_total)
  end

  def self.fat_sum
    sum(:fat_total)
  end

end
