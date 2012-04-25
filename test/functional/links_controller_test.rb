require 'test_helper'

class LinksControllerTest < ActionController::TestCase
  test "should get links" do
    get :links
    assert_response :success
  end

end
