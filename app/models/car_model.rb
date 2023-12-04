class CarModel < ApplicationRecord
  belongs_to :manufacturer

  validates :car_model_name, presence: true
  validates :car_model_name, uniqueness: true

  validates :manufacturer_id, presence: true, numericality: { only_integer: true }

  validates :description, presence: true
end
