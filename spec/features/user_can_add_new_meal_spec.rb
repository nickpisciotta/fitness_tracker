require 'rails_helper'

RSpec.feature "User adds meatl to database" do
  scenario "user searches for food" do
    user = user_create
    create_meal_categories
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit new_meal_path

    fill_in "Title", with: "chicken"
    select 6, from: "meal[quantity]"

    select "Lunch", from: "meal[meal_category_id]"
    click_on "Add Item"


  end
end
