class User < ActiveRecord::Base
  has_many :meals
  has_many :meal_goals
  has_many :activity_goals

  def self.from_omniauth(auth_info)
    user = where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid            = auth_info.uid
      new_user.display_name   = auth_info.info.display_name
    end
    user.oauth_token    = auth_info.credentials.token
    user.refresh_token  = auth_info.credentials.refresh_token
    user.expires_at     = auth_info.credentials.expires_at
    user.save
    user
  end

  def self.update_user_access_token(user, response)
    user_id = response["user_id"]
    new_access_token = ["access_token"]
    new_refresh_token = ["refresh_token"]
    new_expiration_time = user.expires_at + response["expires_in"]
    user.update(oauth_token: new_access_token)
    user.update(refresh_token: new_refresh_token)
    user.update(expires_at: new_expiration_time)
  end

end
