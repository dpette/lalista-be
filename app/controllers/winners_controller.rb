class WinnersController < ApplicationController
  before_action :set_winner, only: [:show, :update, :destroy]

  # GET /winners
  def index
    @winners = Winner.order(created_at: :desc)

    render json: @winners.as_json(only: :created_at, include: [:person, :points])
  end

  # POST /winners
  def create
    person = Person.ranking.first.person
    points = person.points.not_won
    @winner = Winner.new(person: person)

    if @winner.save
      points.update_all(winner_id: @winner.id)
      render json: @winner.as_json(only: :created_at, include: [:person, :points]), status: :created
    else
      render json: @winner.errors, status: :unprocessable_entity
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_winner
      @winner = Winner.find(params[:id])
    end
end
