ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
  include Devise::TestHelpers
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def teardown
  	Capybara.reset_sessions!
  	Capybara.use_default_driver
  end
end


def sign_in_as(email1, password1)
  visit root_url
  click_link "Log In"
  assert_equal current_path, login_path
  fill_in "Email", with: email1
  fill_in "Password", with: password1
  click_button "Sign in"
  puts current_path
  # assert_equal root_url, current_path
  # puts current_user
end