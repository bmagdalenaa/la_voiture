class Fuel < ApplicationRecord
  validates :fuel_name, presence: true
  validates :fuel_name, uniqueness: true
end
