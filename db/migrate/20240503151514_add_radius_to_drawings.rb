class AddRadiusToDrawings < ActiveRecord::Migration[7.1]
  def change
    add_column :drawings, :radius, :integer
  end
end
