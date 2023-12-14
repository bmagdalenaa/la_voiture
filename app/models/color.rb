class Color < ApplicationRecord
  def to_s
    self.color_name
  end

  validates :color_name, presence: true
  validates :color_name, uniqueness: true
end
