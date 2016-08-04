FactoryGirl.define do

  factory :meal do
    protein_total [1, 2, 3].sample
    fat_total [1, 2, 3].sample
    carbohydrates_total [1,2,3].sample
    user
    title ["Item1", "Item2"].sample
    calorie_total [1, 2, 3].sample
    meal_category
  end

  factory :user do
    display_name "User1"
    uid ENV["fitbit_uid"]
    oauth_token ENV["fitbit_token"]
  end

  factory :goal do
    total_steps Faker::Number.number(4)
    total_calories_burned Faker::Number.number(4)
    total_calories Faker::Number.number(4)
    total_protein Faker::Number.number(4)
    total_carbohydrates Faker::Number.number(4)
    total_fat Faker::Number.number(4)
    user
  end

  factory :meal_category do
    name ["Breakfast", "Lunch"].sample
  end

end
