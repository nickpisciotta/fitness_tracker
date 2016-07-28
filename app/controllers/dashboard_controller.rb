class DashboardController < ApplicationController

  def index
  end

  def show
  if current_user
    @activity = Activity.new(current_user, params[:day])
  end
  end

end
