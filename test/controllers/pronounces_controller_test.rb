require 'test_helper'

class PronouncesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pronounce = pronounces(:one)
  end

  test "should get index" do
    get pronounces_url, as: :json
    assert_response :success
  end

  test "should create pronounce" do
    assert_difference('Pronounce.count') do
      post pronounces_url, params: { pronounce: { person_id: @pronounce.person_id, word_id: @pronounce.word_id } }, as: :json
    end

    assert_response 201
  end

  test "should show pronounce" do
    get pronounce_url(@pronounce), as: :json
    assert_response :success
  end

  test "should update pronounce" do
    patch pronounce_url(@pronounce), params: { pronounce: { person_id: @pronounce.person_id, word_id: @pronounce.word_id } }, as: :json
    assert_response 200
  end

  test "should destroy pronounce" do
    assert_difference('Pronounce.count', -1) do
      delete pronounce_url(@pronounce), as: :json
    end

    assert_response 204
  end
end
