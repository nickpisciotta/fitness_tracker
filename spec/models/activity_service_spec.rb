require 'rails_helper'


RSpec.describe ActivityService do
  context "#get_total_steps" do
    it "returns total steps" do
      VCR.use_cassette("total_steps") do
        user = user_create
        day = "2016-07-27"
        faraday_connection = Faraday.new("https://api.fitbit.com/1/user/-/activities/")
        faraday_connection.headers["Authorization"] = "Bearer #{user.oauth_token}"
        faraday_response = faraday_connection.get("steps/date/#{day}/1d.json")
        parsed_response = JSON.parse(faraday_response.body)
        expected_total_steps = parsed_response["activities-steps"].first["value"]

        connection = ActivityService.new(user)
        response = connection.get_total_steps(day)
        total_steps = response["activities-steps"].first["value"]

        expect(total_steps).to eq(expected_total_steps)
      end
    end
  end

  context "#get_total_calories" do
    it "returns total calories" do
      VCR.use_cassette("total_calories") do
        user = user_create
        day = "2016-07-27"
        faraday_connection = Faraday.new("https://api.fitbit.com/1/user/-/activities/")
        faraday_connection.headers["Authorization"] = "Bearer #{user.oauth_token}"
        faraday_response = faraday_connection.get("calories/date/#{day}/1d.json")
        parsed_response = JSON.parse(faraday_response.body)
        expected_total_calories = parsed_response["activities-calories"].first["value"]

        connection = ActivityService.new(user)
        response = connection.get_total_calories(day)
        total_calories = response["activities-calories"].first["value"]

        expect(total_calories).to eq(expected_total_calories)
      end
    end
  end

  context "#get_total_distance" do
    it "returns total distance" do
      VCR.use_cassette("total_distance") do
        user = user_create
        day = "2016-07-27"
        faraday_connection = Faraday.new("https://api.fitbit.com/1/user/-/activities/")
        faraday_connection.headers["Authorization"] = "Bearer #{user.oauth_token}"
        faraday_response = faraday_connection.get("distance/date/#{day}/1d.json")
        parsed_response = JSON.parse(faraday_response.body)
        expected_total_distance = parsed_response["activities-distance"].first["value"]

        connection = ActivityService.new(user)
        response = connection.get_total_distance(day)
        total_distance = response["activities-distance"].first["value"]

        expect(total_distance).to eq(expected_total_distance)
      end
    end
  end

  context "#get_minutes_sedentary" do
    it "returns total minutes sedentary" do
      VCR.use_cassette("total_minutes_sedentary") do
        user = user_create
        day = "2016-07-27"
        faraday_connection = Faraday.new("https://api.fitbit.com/1/user/-/activities/")
        faraday_connection.headers["Authorization"] = "Bearer #{user.oauth_token}"
        faraday_response = faraday_connection.get("minutesSedentary/date/#{day}/1d.json")
        parsed_response = JSON.parse(faraday_response.body)
        expected_minutes_sedentary = parsed_response["activities-minutesSedentary"].first["value"]

        connection = ActivityService.new(user)
        response = connection.get_minutes_sedentary(day)
        total_minutes_sedentary = response["activities-minutesSedentary"].first["value"]

        expect(total_minutes_sedentary).to eq(expected_minutes_sedentary)
      end
    end
  end

  context "#get_resting_heartrate" do
    it "returns resting heartrate" do
      VCR.use_cassette("resting_heartrate") do
        user = user_create
        day = "2016-07-27"
        faraday_connection = Faraday.new("https://api.fitbit.com/1/user/-/activities/")
        faraday_connection.headers["Authorization"] = "Bearer #{user.oauth_token}"
        faraday_response = faraday_connection.get("heart/date/#{day}/1d.json")
        parsed_response = JSON.parse(faraday_response.body)
        expected_resting_heartrate = parsed_response["activities-heart"][0]["value"]["restingHeartRate"]

        connection = ActivityService.new(user)
        response = connection.get_resting_heartrate(day)
        resting_heartrate = response["activities-heart"][0]["value"]["restingHeartRate"]

        expect(resting_heartrate).to eq(expected_resting_heartrate)
      end
    end
  end

end
