class Meal < ApplicationRecord
  belongs_to :meal_category
  belongs_to :user
end
