class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :update, :destroy, :archive]

  # GET /people
  def index
    archived = params[:archived].in?(['true', '1']) ? true : nil 
    
    @people = Person.archived(archived).order(:name)

    render json: @people
  end

  # GET /people/1
  def show
    render json: @person
  end

  # POST /people
  def create
    @person = Person.new(person_params)

    if @person.save
      render json: @person, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      render json: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end


  # DELETE /people/1
  def destroy
    @person.destroy
  end

  def ranking
    @ranking = Person.ranking

    render json: @ranking.as_json(only: :points_count, include: :person)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def person_params
      params.require(:person).permit(:name, :archived_at, :archived)
    end
end
