require "csv"

# CSV FILE DATA
# opens and reads greatest_hits.csv
filename = Rails.root.join("db/car_data.csv")
puts "Loading Cars from the CSV file: #{filename}"
csv_data = File.read(filename)

car_data = CSV.parse(csv_data, headers: true, encoding: "utf-8")

# Manufacturer.destroy_all

# car_data.each do |c|
#   manufacturer = Manufacturer.create(manufacturer_name: c["manufacturer_name"])
# end

require 'faker'

# unless AdminUser.exists?(email: 'admin@example.com')
#   AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
# end

# Color
# 10.times do
#   Color.create(color_name: Faker::Vehicle.color)
# end

# Fuel
# 6.times do
#   Fuel.create(fuel_name: Faker::Vehicle.fuel_type)
# end

# Type
# 11.times do
#   Type.create(type_name: Faker::Vehicle.car_type)
# end
