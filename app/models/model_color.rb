class ModelColor < ApplicationRecord
  belongs_to :color
  belongs_to :car_models

  validates :color_id, presence: true, numericality: { only_integer: true }

  validates :car_models_id, presence: true, numericality: { only_integer: true }
end