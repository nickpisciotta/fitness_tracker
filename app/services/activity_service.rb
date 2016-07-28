class ActivityService

  def initialize(user)
    check_for_expired_token(user)
    user.reload
    @_connection = Faraday.new("https://api.fitbit.com/1/user/-/activities/")
    @_connection.headers["Authorization"] = "Bearer #{user.oauth_token}"
  end

  def get_total_steps(day)
    response = connection.get("steps/date/#{day}/1d.json")
    parse(response)
  end

  def get_total_calories(day)
    response = connection.get("calories/date/#{day}/1d.json")
    parse(response)
  end

  def get_total_distance(day)
    response = connection.get("distance/date/#{day}/1d.json")
    parse(response)
  end

  def get_minutes_sedentary(day)
    response = connection.get("minutesSedentary/date/#{day}/1d.json")
    parse(response)
  end

  def get_resting_heartrate(day)
    response = connection.get("heart/date/#{day}/1d.json")
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end

  private
    def connection
      @_connection
    end

    def check_for_expired_token(user)
      if user.expires_at < Time.now.getutc.to_i
        NewTokenService.new(user).get_new_token
      end
    end
end
