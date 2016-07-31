class MealsController < ApplicationController

  def new
    @user = current_user
    @meal = @user.meals.new
  end

  def create
    if params[:meal]
      @user = current_user
      @meal = @user.meals.create(initial_meal_params)
    elsif params[:meal_info]
      @user = current_user
      @meal = @user.meals.last.update!(calorie_total: total_calorie_params)
      redirect_to new_meal_path
    else
      render :new
    end
  end


  private
    def initial_meal_params
      params.require(:meal).permit(:title, :meal_category_id)
    end

    def total_calorie_params
      params[:meal_info]["totalCalories"]
    end
end
