require 'rails_helper'

RSpec.feature "User adds meal to database", :js => true do

  scenario "user searches for food" do

    user = user_create
    create_meal_categories
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit new_meal_path

    fill_in "meal[title]", with: "large egg"
    select 1, from: "meal[quantity]"

    select "Breakfast", from: "meal[meal_category_id]"

    page.click_on "Add Food"

    wait_for_ajax

    page.reset!

    expect(user.meals.count).to eq(1)
    expect(user.meals.first.meal_category_id).to eq(1)
  end
end
