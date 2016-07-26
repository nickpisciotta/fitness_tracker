Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, '227R6B', '558612f0024307fb904bb4cce8b910ba', scope: "activity profile heartrate location sleep"
end
