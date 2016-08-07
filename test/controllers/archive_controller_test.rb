require 'test_helper'

class ArchiveControllerTest < ActionController::TestCase
  test "should get month" do
    get :month
    assert_response :success
  end

  test "should get recommend" do
    get :recommend
    assert_response :success
  end

end
