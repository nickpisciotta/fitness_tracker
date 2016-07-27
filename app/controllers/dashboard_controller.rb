class DashboardController < ApplicationController

  def index
    if current_user
      @activity = Activity.new(current_user, params[:day])
    end
  end

  # def show
  # end

end
