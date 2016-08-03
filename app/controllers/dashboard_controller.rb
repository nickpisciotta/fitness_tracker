class DashboardController < ApplicationController

  def index
  end

  def show
    @activity = Activity.new(current_user, params[:date])
    @meals = Meal.find_meals_by_day(current_user, params[:date])
    if @goals.nil?
      flash[:notice] = "Please Add Goals"
      redirect_to new_goal_path
    else
      @goals = current_user.goals.last
    end
  end


end
