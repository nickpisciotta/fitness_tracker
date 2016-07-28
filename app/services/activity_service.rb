class ActivityService

  def initialize(user)
    @_connection = Faraday.new("https://api.fitbit.com/1/user/-/activities/")
    @_connection.headers["Authorization"] = "Bearer #{user.oauth_token}"
  end

  def get_total_steps(day)
    # formatted_date = format_date(day)
    response = connection.get("steps/date/#{day}/1d.json")
    parse(response)
  end

  def get_total_calories(day)
    # formatted_date = format_date(day)
    response = connection.get("calories/date/#{day}/1d.json")
    parse(response)
  end

  def get_total_distance(day)
    # formatted_date = format_date(day)
    response = connection.get("distance/date/#{day}/1d.json")
    parse(response)
  end

  def get_minutes_sedentary(day)
    # formatted_date = format_date(day)
    response = connection.get("minutesSedentary/date/#{day}/1d.json")
    parse(response)
  end

  def get_resting_heartrate(day)
    # formatted_date = format_date(day)
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

    # def format_date(date)
    #   (Date.parse(date)).strftime("%Y-%m-%d")
    # end

end
