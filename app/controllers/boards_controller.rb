class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update, :destroy]

  # GET /boards
  def index
    @boards = Board.all

    render json: @boards
  end

  # GET /boards/1
  def show
    render json: @board
  end

  # POST /boards
  def create
    @board = Board.create(board_params)
    puts 'boardname', @board.name
    puts 'boardniums', @board.probability
    puts 'boardtiles', @board.tiles

    if @board
      render json: @board, status: :created, location: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /boards/1
  def update
    if @board.update(board_params)
      render json: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  # DELETE /boards/1
  def destroy
    puts 'params', params
    board = Board.destroy(params[:id])
    render json: { status: 204 }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def board_params
      params.permit(:name, tiles: [], probability: [])
    end
end
