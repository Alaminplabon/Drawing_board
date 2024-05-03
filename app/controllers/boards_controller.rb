class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    @drawings = @board.drawings
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to @board
    else
      render 'index'
    end
  end

  private

  def board_params
    params.require(:board).permit(:name)
  end
end
