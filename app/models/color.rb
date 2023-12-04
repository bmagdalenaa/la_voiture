class Color < ApplicationRecord
  validates :color_name, presence: true
  validates :color_name, uniqueness: true
end
