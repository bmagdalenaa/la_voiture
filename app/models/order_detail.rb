class OrderDetail < ApplicationRecord
  belongs_to :contact_list

  validates :order_number, presence: true
  validates :order_number, uniqueness: true

  validates :order_price, presence: true

  validates :order_date, presence: true

  validates :quantity, presence: true

  validates :gst, presence: true

  validates :pst, presence: true

  validates :harmonized_tax, presence: true
end
