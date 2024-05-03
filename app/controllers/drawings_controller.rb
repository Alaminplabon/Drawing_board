class DrawingsController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    @drawing = @board.drawings.new(drawing_params)

    case params[:drawing][:tool]
    when "Pencil"
      draw_pencil(@drawing)
    when "Eraser"
      erase(@drawing)
    when "Rectangle"
      draw_rectangle(@drawing)
    when "Circle"
      draw_circle(@drawing)
    else
      # Default behavior
    end

    if @drawing.save
      redirect_to @board, notice: "Drawing created successfully."
    else
      redirect_to @board, alert: "Failed to create drawing."
    end
  end

  private

  def drawing_params
    params.require(:drawing).permit(:x, :y, :tool, :color)
  end

  def draw_pencil(drawing)
    # Implement drawing with pencil
    # For simplicity, let's draw a small circle at the given coordinates
    drawing.radius = 5
    drawing.shape = "circle"
  end

  def erase(drawing)
    # Ensure that x and y coordinates are not nil
    return unless drawing.x && drawing.y

    # Implement erasing
    # For simplicity, let's delete drawings within a certain area
    Drawing.where(board_id: drawing.board_id, x: drawing.x - 5..drawing.x + 5, y: drawing.y - 5..drawing.y + 5).destroy_all
  end

  def draw_rectangle(drawing)
    # Implement drawing rectangles
    # For simplicity, let's draw a rectangle centered at the given coordinates
    drawing.width = 20
    drawing.height = 10
    drawing.shape = "rectangle"
  end

  def draw_circle(drawing)
    # Implement drawing circles
    # For simplicity, let's draw a circle centered at the given coordinates
    drawing.radius = 10
    drawing.shape = "circle"
  end
end
