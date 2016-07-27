class ActivityService

  def initialize(user)
    @_connection = Faraday.new("https://api.fitbit.com/1/user/-/activities")
    @_connection.headers["Authorization"] = "Bearer #{user.oauth_token}"
  end

  def get_total_steps(day)
    formatted_date = format_date(day)
    response = connection.get("/steps/date/#{formatted_date}/1d.json")
    byebug
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end

  private
    def connection
      @_connection
    end

    def format_date(date)
      date.strftime("%Y-%m-%d")
    end

end
