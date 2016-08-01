require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  
  test "should get index" do
    get :index
    assert_response :success
  end

end
