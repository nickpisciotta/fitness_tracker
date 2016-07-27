class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid            = auth_info.uid
      new_user.display_name   = auth_info.info.display_name
      new_user.oauth_token    = auth_info.credentials.token
      new_user.refresh_token  = auth_info.credentials.refresh_token
    end
  end

  def self.update_user_access_token(response, token)
    user_id = JSON.parse(response.body)["user_id"]
    user = User.where(uid: user_id)
    user.update(oauth_token: token)
  end

end
