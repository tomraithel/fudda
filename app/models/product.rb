class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :ingredients, dependent: :destroy
  has_many :receipes, through: :ingredients
end
