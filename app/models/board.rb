class Board < ApplicationRecord
  has_many :drawings, dependent: :destroy
end
