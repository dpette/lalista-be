require 'test_helper'

class CoverImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cover_image = cover_images(:one)
  end

  test "should get index" do
    get cover_images_url, as: :json
    assert_response :success
  end

  test "should create cover_image" do
    assert_difference('CoverImage.count') do
      post cover_images_url, params: { cover_image: { url: @cover_image.url } }, as: :json
    end

    assert_response 201
  end

  test "should show cover_image" do
    get cover_image_url(@cover_image), as: :json
    assert_response :success
  end

  test "should update cover_image" do
    patch cover_image_url(@cover_image), params: { cover_image: { url: @cover_image.url } }, as: :json
    assert_response 200
  end

  test "should destroy cover_image" do
    assert_difference('CoverImage.count', -1) do
      delete cover_image_url(@cover_image), as: :json
    end

    assert_response 204
  end
end
