class AddHeightToDrawings < ActiveRecord::Migration[7.1]
  def change
    add_column :drawings, :height, :integer
  end
end
