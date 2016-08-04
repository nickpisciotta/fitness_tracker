class DashboardController < ApplicationController

  def index
  end

  def show
    @activity = Activity.new(current_user, params[:date][:Date])
    @meals = Meal.find_meals_by_day(current_user, params[:date][:Date])
    @goals = current_user.goals.last
    if @goals.nil?
      flash[:notice] = "Please Add Goals"
      redirect_to new_goal_path
    else
      @goals
    end
  end


end
