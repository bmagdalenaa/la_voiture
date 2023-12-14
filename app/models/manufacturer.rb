class Manufacturer < ApplicationRecord
  def to_s
    self.manufacturer_name
  end
  has_many :car_models
  has_one_attached :image
  validates :manufacturer_name, presence: true
  validates :manufacturer_name, uniqueness: true
end
