class Vehicle < ApplicationRecord
  belongs_to :type
  belongs_to :model
  belongs_to :fuel
  belongs_to :order_details
end
