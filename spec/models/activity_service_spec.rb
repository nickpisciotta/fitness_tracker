require 'rails_helper'

RSpec.describe ActivityService do
  user = User.create(
    display_name: "User1"
    uid: ENV["fitbit_uid"]
    oauth_token: ENV["fitbit_token"]
  )
  context "#get_total_steps" do
    it "returns total steps" do
      VCR.use_cassette("total_steps") do
        connection = ActivityService.new(user)
        response = connection.get_total_steps
        byebug

      end
    end
  end
end
