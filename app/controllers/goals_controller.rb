class GoalsController < ApplicationController

  def create
    @user = current_user
    @goal = current_user.goals.new(goal_params)
    if @goal.save
      redirect_to goal_path(@goal)
    else
      render :new
    end
  end

  def index
    @goal = current_user.goals.last
  end

  def show
    @user = current_user
    @goal = @user.goals.find_by(id: params[:id])
  end

  def new
    @user = current_user
    @goal = @user.goals.new
  end

  def edit
    @goal = current_user.goals.find_by(id: params[:id])
  end

  def update
    @goal = Goal.find_by(id: params[:id])
    if @goal.update(goal_params)
      flash[:success] = "Changes to goals successfully made"
      redirect_to goal_path(@goal)
    else
      render :edit
    end
  end

  private
    def goal_params
      params.require(:goal).permit(:total_steps, :total_calories_burned,
                                   :total_calories, :total_protein, :total_carbohydrates,
                                   :total_fat)
    end

end
