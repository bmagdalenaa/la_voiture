class ContactList < ApplicationRecord
  validates :first_name, presence: true
  validates :first_name, uniqueness: true

  validates :last_name, presence: true
  validates :last_name, uniqueness: true

  validates :address, presence: true

  validates :city, presence: true

  validates :province, presence: true
end
