require 'test_helper'

class RoadtripsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get roadtrips_new_url
    assert_response :success
  end

  test "should get index" do
    get roadtrips_index_url
    assert_response :success
  end

  test "should get show" do
    get roadtrips_show_url
    assert_response :success
  end

  test "should get edit" do
    get roadtrips_edit_url
    assert_response :success
  end

end
