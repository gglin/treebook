require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  
  test "that /login route opens the login page" do
  	get '/login'
  	assert_response :success
  end

  test "that /register route opens the register page" do
  	get '/register'
  	assert_response :success
  end

  test "that a profile page works" do
  	get '/jasonseifer'
  	assert_response :success
  end
  
  test "that correct profile page visited" do
    sign_in_as("jason@teamtreehouse.com","")
    user = users(:jason)
    prof = user.profile_name
    visit profiles_path(prof)
    assert_equal current_path, '/jasonseifer'
    within(".all-stats") do
      click_link "All Statuses"
      assert_equal feed_path, current_path
    end
  end

end
