class AddWidthToDrawings < ActiveRecord::Migration[7.1]
  def change
    add_column :drawings, :width, :integer
  end
end
