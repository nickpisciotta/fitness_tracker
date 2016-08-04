class NewTokenService

  def initialize(user)
    @user = user
    @connection = Faraday.new("https://api.fitbit.com/oauth2/token")
    @connection.headers["Content-Type"] = "application/x-www-form-urlencoded"
    @connection.headers["Authorization"] = "Basic #{ENV['base_64_code']}"
    @connection.params["grant_type"] = "refresh_token"
    @connection.params["refresh_token"] = "#{user.refresh_token}"
  end

  def get_new_token
    response = @connection.post
    parsed_response = JSON.parse(response.body)
    User.update_user_access_token(current_user, parsed_response)
  end

  private
    def current_user
      @user
    end
end
