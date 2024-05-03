class CreateDrawings < ActiveRecord::Migration[7.1]
  def change
    create_table :drawings do |t|
      t.references :board, null: false, foreign_key: true
      t.integer :x
      t.integer :y
      t.string :tool
      t.string :color

      t.timestamps
    end
  end
end
