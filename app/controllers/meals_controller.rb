class MealsController < ApplicationController

  def new
    @user = current_user
    @meal = @user.meals.new
    @meals = @user.meals.all
  end

  def create
    meal = MealParamsHandler.set_meal_attributes(current_user, params[:meal_info])
    render json: meal
  end

  def update
    @meal = Meal.find_by(id: params[:id])
    if @meal.update!(quantity: params[:meal][:quantity],
                    meal_category_id: meal_by_category_id(params[:meal][:meal_category_id]))
        redirect_to new_meal_path
    else
      render :edit
    end
  end

  def edit
    @meal = current_user.meals.find_by(id: params[:id])
  end

  def show
  end

  def destroy
    @meal = current_user.meals.find_by(id: params[:id])
    @meal.destroy
    redirect_to new_meal_path
  end

  private
    def meal_params
      params.require(:meal).permit(:quantity, :meal_category_id)
    end

    def meal_by_category_id(params)
      MealCategory.find_by(name: params).id
    end
end
