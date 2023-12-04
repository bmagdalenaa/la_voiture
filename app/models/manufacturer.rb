class Manufacturer < ApplicationRecord
  has_many :car_models

  validates :manufacturer_name, presence: true
  validates :manufacturer_name, uniqueness: true
end
