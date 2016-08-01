class Goal < ActiveRecord::Base
  belongs_to :user

  validates :total_steps, presence: true
  validates :total_calories_burned, presence: true
  validates :total_calories, presence: true
  validates :total_protein, presence: true
  validates :total_carbohydrates, presence: true
  validates :total_fat, presence: true

end
