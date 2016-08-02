class DashboardController < ApplicationController

  def index
    # if current_user
    #   @activity = Activity.new(current_user, params[:date])
    # end
  end

  def show
    @activity = Activity.new(current_user, params[:date])
    @meals = Meal.find_meals_by_day(current_user, params[:date])
    @goals = current_user.goals.last
  end


end
