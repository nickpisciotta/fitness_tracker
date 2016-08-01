require 'rails_helper'

RSpec.feature "User can add goals" do
  scenario "adding meal goals" do
    user = user_create
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit new_goal_path

    fill_in "Total steps", with: "1000"
    fill_in "Total calories burned", with: "1000"
    fill_in "Total calories", with: "2000"
    fill_in "Total protein", with: "100"
    fill_in "Total carbohydrates", with: "200"
    fill_in "Total fat", with: "50"

    click_on "Save Goals"

    expect(user.goals.count).to eq(1)
    expect(user.goals.first.total_steps).to eq(1000)
    expect(user.goals.first.total_calories_burned).to eq(1000)
    expect(user.goals.first.total_calories).to eq(2000)
    expect(user.goals.first.total_protein).to eq(100)
    expect(user.goals.first.total_carbohydrates).to eq(200)
    expect(user.goals.first.total_fat).to eq(50)
    expect(current_path).to eq(goal_path(user.goals.first))

    within(".goals") do
      expect(page).to have_content("Total Steps")
      expect(page).to have_content("Total Calories Burned")
      expect(page).to have_content("Total Calories Eaten")
      expect(page).to have_content("Total Protein")
      expect(page).to have_content("Total Carbohydrates")
      expect(page).to have_content("Total Fat")
    end

  end
end
