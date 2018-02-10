class PronouncesController < ApplicationController
  before_action :set_pronounce, only: [:show, :update, :destroy]

  # GET /pronounces
  def index
    @pronounces = Pronounce.all

    render json: @pronounces
  end

  # GET /pronounces/1
  def show
    render json: @pronounce
  end

  # POST /pronounces
  def create
    @pronounce = Pronounce.new(pronounce_params)

    if @pronounce.save
      render json: @pronounce, status: :created, location: @pronounce
    else
      render json: @pronounce.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pronounces/1
  def update
    if @pronounce.update(pronounce_params)
      render json: @pronounce
    else
      render json: @pronounce.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pronounces/1
  def destroy
    @pronounce.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pronounce
      @pronounce = Pronounce.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pronounce_params
      params.require(:pronounce).permit(:person_id, :word_id)
    end
end
