class Receipe < ApplicationRecord
  has_many :ingredients
  has_many :products, through: :ingredients
end
