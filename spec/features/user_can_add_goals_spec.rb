require 'rails_helper'

RSpec.feature "User can add goals"
  scenario "adding meal goals" do
    user = user_create
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit new_goal_path

    fill_in "Total Calories", with: "2000"
    select 100, from: "goals[protein]"
    select 200, from: "goals[carbohydrates]"
    select 50, from: "goals[fat]"

    click_on "Set Goals"

  end
end
