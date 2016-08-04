require 'rails_helper'

RSpec.feature "User can edit goals" do
  scenario "Edit goals" do
    user = user_create
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )
    goal = user.goals.create(total_steps: 1000, total_calories_burned: 1000,
                             total_calories: 1000, total_protein: 100,
                             total_carbohydrates: 200, total_fat: 50)

    visit goal_path(goal)

    within(".goals") do
      expect(page).to have_content("Total Steps")
    end

    click_on "Edit Goal"

    expect(current_path).to eq (edit_goal_path(goal))

    fill_in "Total steps", with: "2000"

    click_on "Edit Goals"

    user_goal = user.goals.find_by(id: goal.id)

    expect(user_goal.total_steps).to eq(2000)
  end

  scenario "Edit goals with blank entry" do
    user = user_create
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )
    goal = user.goals.create(total_steps: 1000, total_calories_burned: 1000,
                             total_calories: 1000, total_protein: 100,
                             total_carbohydrates: 200, total_fat: 50)

    visit goal_path(goal)

    within(".goals") do
      expect(page).to have_content("Total Steps")
    end

    click_on "Edit Goal"

    expect(current_path).to eq (edit_goal_path(goal))

    fill_in "Total steps", with: ""

    click_on "Edit Goals"

    expect(page).to have_content("Goals Did Not Save.")
  end
end
