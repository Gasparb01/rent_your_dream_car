require 'test_helper'

class ReviewsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reviews_controller_new_url
    assert_response :success
  end

  test "should get create" do
    get reviews_controller_create_url
    assert_response :success
  end

end
