class Ingredient < ApplicationRecord
  validates :quantity, presence: true

  belongs_to :product
  belongs_to :receipe

end
