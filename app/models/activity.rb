class Activity

  def initialize(user, day)
    @_user = user
    @_day = day
     byebug
  end

  def self.service
    @service ||= ActivityService.new(user)
  end

  def self.total_steps_by_day(day)
    total_steps_response = service.get_total_steps(day)
    total_steps = total_steps_response["activities-steps"]["value"]
  end

  def self.total_calories_by_day(day)
    total_calorie_response = service.get_total_calories(day)
    total_calories = total_calorie_response["activities-calories"]["value"]
  end

  def self.total_distance_by_day(day)
    total_distance_response = service.get_total_distance(day)
    total_distance = total_distance_response["activities-distance"]["value"]
  end

  def self.total_minutes_sedentary_by_day(day)
    total_minutes_sedentary_response = service.get_minutes_sedentary(day)
    total_minutes_sedentary = total_minutes_sedentary_response["activities-minutesSedentary"]["value"]
  end

  def self.resting_heart_rate_by_day(day)
    resting_heartrate_response = service.get_resting_heartrate(day)
    resting_heartrate = resting_heartrate_response["activities-heart"][0]["value"]["restingHeartRate"]
  end


  private
    def user
      @_user
    end

    def day
      @_day["year"] + "-" + @_day["month"] + "-" + @_day["day"]
    end


end
