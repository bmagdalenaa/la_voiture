class Type < ApplicationRecord
  validates :type_name, presence: true
  validates :type_name, uniqueness: true
end
