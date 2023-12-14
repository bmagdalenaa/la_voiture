class Fuel < ApplicationRecord
  def to_s
    self.fuel_name
  end

  validates :fuel_name, presence: true
  validates :fuel_name, uniqueness: true
end
