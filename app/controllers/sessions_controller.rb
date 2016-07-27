class SessionsController < ApplicationController

  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      NewTokenService.new(user, request.env["omniauth.auth"]).get_new_token
      session[:user_id] = user.id
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
