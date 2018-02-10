require 'test_helper'

class PointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @point = points(:one)
  end

  test "should get index" do
    get points_url, as: :json
    assert_response :success
  end

  test "should create point" do
    assert_difference('Point.count') do
      post points_url, params: { point: { person_id: @point.person_id, word_id: @point.word_id } }, as: :json
    end

    assert_response 201
  end

  test "should show point" do
    get point_url(@point), as: :json
    assert_response :success
  end

  test "should update point" do
    patch point_url(@point), params: { point: { person_id: @point.person_id, word_id: @point.word_id } }, as: :json
    assert_response 200
  end

  test "should destroy point" do
    assert_difference('Point.count', -1) do
      delete point_url(@point), as: :json
    end

    assert_response 204
  end
end
