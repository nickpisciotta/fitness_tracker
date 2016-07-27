class NewTokenService

  def initialize(user, request)
    @user = user
    @connection = Faraday.new("https://api.fitbit.com/oauth2/token")
    @connection.headers["Content-Type"] = "application/x-www-form-urlencoded"
    @connection.headers["Authorization"] = "Basic #{ENV['base_64_code']}"
    @connection.params["grant_type"] = "refresh_token"
    @connection.params["refresh_token"] = "#{request.credentials.refresh_token}"
  end

  def get_new_token
    response = @connection.post
    new_token = JSON.parse(response.body)["access_token"]
    User.update_user_access_token(response, new_token)
  end
end
