require 'rails_helper'

RSpec.feature "User views dashboard" do
  scenario "Sees stats on dashboard" do
    user = user_create
    goals = create(:goal, user: user)
    create_meal_categories

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit dashboard_index_path

    fill_in "date[Date]", with: "13/06/2016"

    click_on "Submit"

    within(".meal-stats") do
      expect(page).to have_content("Meal Stats")
    end

    within(".fitness-stats") do
      expect(page).to have_content("Fitness Stats")
    end
  end

  scenario "User tries to view dashboard without goals" do
    user = user_create
    create_meal_categories

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit dashboard_index_path

    fill_in "date[Date]", with: "13/06/2016"
    click_on "Submit"

    expect(current_path).to eq(new_goal_path)
    expect(page).to have_content("Please Add Goals")
  end
end
