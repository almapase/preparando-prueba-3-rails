require 'test_helper'

class PokeDesksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
