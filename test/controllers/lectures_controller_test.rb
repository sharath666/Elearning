require 'test_helper'

class LecturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lecture = lectures(:one)
  end

  test "should get index" do
    get lectures_url
    assert_response :success
  end

  test "should get new" do
    get new_lecture_url
    assert_response :success
  end

  test "should create lecture" do
    assert_difference('Lecture.count') do
      post lectures_url, params: { lecture: { chapter_id: @lecture.chapter_id, course_id: @lecture.course_id, description: @lecture.description, name: @lecture.name, video_duration: @lecture.video_duration, video_url: @lecture.video_url } }
    end

    assert_redirected_to lecture_url(Lecture.last)
  end

  test "should show lecture" do
    get lecture_url(@lecture)
    assert_response :success
  end

  test "should get edit" do
    get edit_lecture_url(@lecture)
    assert_response :success
  end

  test "should update lecture" do
    patch lecture_url(@lecture), params: { lecture: { chapter_id: @lecture.chapter_id, course_id: @lecture.course_id, description: @lecture.description, name: @lecture.name, video_duration: @lecture.video_duration, video_url: @lecture.video_url } }
    assert_redirected_to lecture_url(@lecture)
  end

  test "should destroy lecture" do
    assert_difference('Lecture.count', -1) do
      delete lecture_url(@lecture)
    end

    assert_redirected_to lectures_url
  end
end
