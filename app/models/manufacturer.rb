class Manufacturer < ApplicationRecord
  def to_s
    self.manufacturer_name
  end
  has_many :car_models

  validates :manufacturer_name, presence: true
  validates :manufacturer_name, uniqueness: true


  def self.global_search(query)
    if query.present?
      where("manufacturer_name LIKE ?", "%#{query}%")
    else
      all
    end
  end
end
