class CarModel < ApplicationRecord
  def to_s
    self.car_model_name
  end

  has_many :vehicles
  belongs_to :manufacturer
  has_one_attached :image

  validates :car_model_name, presence: true
  validates :car_model_name, uniqueness: true

  validates :manufacturer_id, presence: true, numericality: { only_integer: true }

  def self.global_search(query)
    if query.present?
      where("car_model_name LIKE ?", "%#{query}%")
    else
      all
    end
  end

  # validates :description, presence: true
end
