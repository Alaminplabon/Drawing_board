class Drawing < ApplicationRecord
  validates :x, :y, :color, presence: true
  validates :tool, inclusion: { in: ["Pencil", "Eraser", "Rectangle", "Circle"] }
  validates :radius, :width, :height, numericality: { greater_than_or_equal_to: 0 }, if: -> { tool.in?(["Circle", "Rectangle"]) }
end
