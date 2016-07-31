# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'vcr'
require 'database_cleaner'
require 'factory_girl_rails'

DatabaseCleaner.strategy = :truncation

ActiveRecord::Migration.maintain_test_schema!

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  # c.configure_rspec_metadata!
end

module OmniauthMacros
  def mock_auth_hash
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:fitbit] = OmniAuth::AuthHash.new( {
      'provider' => 'fitbit',
      'uid' => '123545',
      'info' => {
        'display_name' => 'mockuser',
      },
      'credentials' => {
        'token' => 'mock_token'
      }
    })
  end
end

  def user_create
    User.create(
      display_name: "User1",
      uid: ENV["fitbit_uid"],
      oauth_token: ENV["fitbit_token"],
      expires_at: 1469777595)
  end

  def create_meal_categories
    MealCategory.create!(
      name: "Breakfast")
    MealCategory.create!(
      name: "Lunch")
    MealCategory.create!(
      name: "Dinner")
    MealCategory.create!(
      name: "Snack")
  end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include(OmniauthMacros)

  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
