class Meal < ApplicationRecord
  validates :receipe_id, presence: true

  belongs_to :receipe

  def self.find_by_day(date)
    self.find_by({day: date})
  end
end
