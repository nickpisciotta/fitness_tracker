class DashboardController < ApplicationController

  def index
  end

  def show
    @activity = Activity.new(current_user, params[:date])
    @meals = Meal.find_meals_by_day(current_user, params[:date])
    @goals = current_user.goals.last
  end


end
