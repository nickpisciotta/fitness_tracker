class MealsController < ApplicationController

  def new
    @user = current_user
    @meal = @user.meals.new
    @meals = @user.meals.all
  end

  def create
    if params[:meal]
      MealParamsHandler.set_meal_attributes(current_user, params[:meal])
    elsif params[:meal_info]
      MealParamsHandler.set_nutrition_info(current_user, params[:meal_info])
      flash.notice = "Meal Succesfully Added"
    else
      render :new
    end
  end

  def edit
    @meal = current_user.meals.find_by(id: params[:id])
  end
end
