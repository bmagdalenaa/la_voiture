class ModelColor < ApplicationRecord
  # has_many :color
  # has_many :car_models

  validates :color_id, presence: true, numericality: { only_integer: true }

  validates :car_models_id, presence: true, numericality: { only_integer: true }
end