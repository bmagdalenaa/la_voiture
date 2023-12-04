class Vehicle < ApplicationRecord
  belongs_to :type
  belongs_to :model
  belongs_to :fuel
  belongs_to :order_details
  belongs_to :color

  validates :vehicle_name, presence: true

  validates :vehicle_price, presence: true, numericality: true

  validates :vin_identification, presence: true
  validates :vin_identification, uniqueness: true

  validates :type_id, presence: true, numericality: { only_integer: true }

  validates :car_models_id, presence: true, numericality: { only_integer: true }

  validates :fuel_id, presence: true, numericality: { only_integer: true }

  validates :order_details_id, presence: true, numericality: { only_integer: true }

  validates :color_id, presence: true, numericality: { only_integer: true }

  validates :vehicle_year, presence: true, numericality: { only_integer: true }
end
