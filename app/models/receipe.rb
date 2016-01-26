class Receipe < ApplicationRecord
  validates :title, presence: true
  has_many :ingredients
  has_many :products, through: :ingredients
end
