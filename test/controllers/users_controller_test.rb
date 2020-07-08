<<<<<<< HEAD
require 'test_helper'
=======
require "test_helper"
>>>>>>> 21aa6dab15bd4a431576c8dc428a7f6247789b5e

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_path
    assert_response :success
  end

end
