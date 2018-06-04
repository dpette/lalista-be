class WinnersController < ApplicationController
  before_action :set_winner, only: [:show, :update, :destroy]

  # GET /winners
  def index
    @winners = Winner.order(created_at: :desc)

    render json: @winners.as_json(only: :created_at, include: [:person, :points])
  end

  # POST /winners
  def create
    @winner = Winner.new(winner_params)

    person = @winner.person || Person.find(Person.ranking.first.try(:id))
    points = person.points.not_won
    @winner = Winner.new(person: person) if @winner.person.nil?

    if @winner.save
      points.update_all(winner_id: @winner.id)
      render json: @winner.as_json(only: :created_at, include: [:person, :points]), status: :created
    else
      render json: @winner.errors, status: :unprocessable_entity
    end
  end

  private

    def winner_params
      params.permit(:winner).permit(:person_id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_winner
      @winner = Winner.find(params[:id])
    end
end
