class PointsController < ApplicationController
  before_action :set_point, only: [:show, :update, :destroy]

  # GET /points
  def index
    @points = Point.all

    render json: @points.as_json(include: [:person, :word])
  end

  # GET /points/1
  def show
    render json: @point
  end

  # POST /points
  def create
    puts point_params
    @point = Point.new(point_params)

    if @point.save
      render json: @point.as_json(include: [:person, :word]), status: :created, location: @point
    else
      render json: @point.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /points/1
  def update
    if @point.update(point_params)
      render json: @point
    else
      render json: @point.errors, status: :unprocessable_entity
    end
  end

  # DELETE /points/1
  def destroy
    @point.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point
      @point = Point.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def point_params
      params.require(:point).permit(:word_id, :person_id)
    end
end
