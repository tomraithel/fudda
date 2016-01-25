class Product < ApplicationRecord
  has_many :ingredients
  has_many :receipes, through: :ingredients
end
