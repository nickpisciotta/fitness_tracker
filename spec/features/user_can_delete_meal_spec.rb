require 'rails_helper'

RSpec.feature "User deletes meal" do
  scenario "remove food entry" do
    user = user_create
    create_meal_categories
    meal = user.meals.create(meal_category_id: 2, title: "chicken", quantity: 2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    expect(user.meals.count).to eq(1)

    visit new_meal_path

    expect(page).to have_content("chicken")

    click_on "Delete Entry"

    expect(user.meals.count).to eq(0)
  end
end
