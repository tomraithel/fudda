class Receipe < ApplicationRecord
  validates :title, presence: true
  has_many :ingredients, dependent: :destroy
  has_many :products, through: :ingredients
end
