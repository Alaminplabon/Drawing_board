class AddShapeToDrawings < ActiveRecord::Migration[7.1]
  def change
    add_column :drawings, :shape, :string
  end
end
