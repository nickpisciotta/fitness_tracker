require 'rails_helper'

RSpec.feature "User edits meal after adding" do
  scenario "user logs entry then edits" do
    user = user_create
    user.meals.create(meal_category_id: 1, title: "chicken", quantity: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit new_meal_path

    within(".todaysmeals") do
      expect(page).to have_content("chicken")
    end

    click_on "Edit Entry"

    expect(current_path).to eq(edit_meal_path)

    select "3", from: "meal[quantity]"

    click "Edit Entry"

    expect(current_path).to eq(new_meal_path)

    expect(user.meals.last.quantity).to eq(3)
  end
end
