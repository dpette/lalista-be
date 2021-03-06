class WordsController < ApplicationController
  before_action :set_word, only: [:show, :update, :destroy, :archive]

  # GET /words
  def index
    archived = params[:archived].in?(['true', '1']) ? true : nil

    @words = Word.archived(archived).order(:name)

    render json: @words
  end

  # GET /words/1
  def show
    render json: @word
  end

  # POST /words
  def create
    @word = Word.archived.where(name: word_params[:name].downcase).first if word_params[:name]

    if @word
      puts "ehi word exists, put archived to false"
      @word.archived = false
    else
      puts "ehi word does not exists"
      @word = Word.new(word_params)
    end


    if @word.save
      render json: @word, status: :created, location: @word
    else
      render json: @word.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /words/1
  def update
    if @word.update(word_params)
      render json: @word
    else
      render json: @word.errors, status: :unprocessable_entity
    end
  end

  # DELETE /words/1
  def destroy
    @word.destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def word_params
      params.require(:word).permit(:name, :archived_at, :archived)
    end
end
