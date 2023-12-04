class OrderDetail < ApplicationRecord
  belongs_to :contact_list

  validates :order_number, presence: true, numericality: { only_integer: true }
  validates :order_number, uniqueness: true

  validates :order_price, presence: true, numericality: true

  validates :order_date, presence: true

  validates :quantity, presence: true, numericality: { only_integer: true }

  validates :gst, presence: true, numericality: true

  validates :pst, presence: true, numericality: true

  validates :harmonized_tax, presence: true, numericality: true
end
