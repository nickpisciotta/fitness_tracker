FactoryGirl.define do

  factory :user do
    display_name "User1"
    uid ENV["fitbit_uid"]
    oauth_token ENV["fitbit_token"]
    expires_at 1469777595
  end
end
