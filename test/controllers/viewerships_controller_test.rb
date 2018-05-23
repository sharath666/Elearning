require 'test_helper'

class ViewershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @viewership = viewerships(:one)
  end

  test "should get index" do
    get viewerships_url
    assert_response :success
  end

  test "should get new" do
    get new_viewership_url
    assert_response :success
  end

  test "should create viewership" do
    assert_difference('Viewership.count') do
      post viewerships_url, params: { viewership: { fully_watched_vedio: @viewership.fully_watched_vedio, lecture_id: @viewership.lecture_id, user_id: @viewership.user_id } }
    end

    assert_redirected_to viewership_url(Viewership.last)
  end

  test "should show viewership" do
    get viewership_url(@viewership)
    assert_response :success
  end

  test "should get edit" do
    get edit_viewership_url(@viewership)
    assert_response :success
  end

  test "should update viewership" do
    patch viewership_url(@viewership), params: { viewership: { fully_watched_vedio: @viewership.fully_watched_vedio, lecture_id: @viewership.lecture_id, user_id: @viewership.user_id } }
    assert_redirected_to viewership_url(@viewership)
  end

  test "should destroy viewership" do
    assert_difference('Viewership.count', -1) do
      delete viewership_url(@viewership)
    end

    assert_redirected_to viewerships_url
  end
end
