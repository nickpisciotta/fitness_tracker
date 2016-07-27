require 'rails_helper'

describe ActivityService do
  before do
    visit '/'
    mock_auth_hash
    click_on "Login with Fitbit"
  end

  context "#get_steps" do
    it "returns total steps" do
      VCR.use_cassette("total_steps") do
        byebug
        total_steps_response = ActivityService.new.get_total_steps
        total_steps = total_steps_response["activities-tracker-steps"]["value"]

        expect(total_steps).to eq(0)
      end
    end
  end
end
