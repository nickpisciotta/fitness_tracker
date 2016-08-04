require 'rails_helper'

RSpec.describe NewTokenService do
  context "token is expired" do
    it "re-issues new token" do
      VCR.use_cassette("new_token") do
        user = user_create
        initial_token = user.oauth_token
        new_token_service = NewTokenService.new(user)

        new_token_service.get_new_token

        user.reload

        new_token = user.oauth_token
        
        expect(initial_token).to_not eq(new_token)
      end
    end
  end
end
