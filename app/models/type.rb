class Type < ApplicationRecord
  def to_s
    self.type_name
  end

  validates :type_name, presence: true
  validates :type_name, uniqueness: true
end
