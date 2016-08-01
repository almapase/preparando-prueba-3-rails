require 'test_helper'

class PokeDesksControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @user = users(:trainer1)
  end

  test "should get index" do
    get :index, user_id: @user
    assert_response :success
  end

end
