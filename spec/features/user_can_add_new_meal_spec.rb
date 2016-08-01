require 'rails_helper'

RSpec.feature "User adds meal to database" do
  scenario "user searches for food" do
    user = user_create
    create_meal_categories
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit new_meal_path

    fill_in "Title", with: "large chicken breast"
    select 1, from: "meal[quantity]"

    select "1", from: "meal[meal_category_id]"
    click_on "Add Item"

    expect(user.meals.count).to eq(1)
    expect(user.meals.first.meal_category_id). to eq(1)
  end
end
