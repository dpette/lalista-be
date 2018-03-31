class CoverImagesController < ApplicationController
  before_action :set_cover_image, only: [:show, :update, :destroy]

  # GET /cover_images
  def index
    @cover_images = CoverImage.all

    render json: @cover_images
  end

  # GET /cover_images/1
  def show
    render json: @cover_image
  end

  # POST /cover_images
  def create
    @cover_image = CoverImage.new(cover_image_params)

    if @cover_image.save
      render json: @cover_image, status: :created, location: @cover_image
    else
      render json: @cover_image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cover_images/1
  def update
    if @cover_image.update(cover_image_params)
      render json: @cover_image
    else
      render json: @cover_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cover_images/1
  def destroy
    @cover_image.destroy
  end

  # GET /cover_images/active
  def active
    @active_cover_image = CoverImage.active
    render json: @active_cover_image
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_cover_image
      @cover_image = CoverImage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cover_image_params
      params.require(:cover_image).permit(:url)
    end
end
