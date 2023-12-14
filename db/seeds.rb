require "faker"
require "csv"
require 'net/http'

# Delete data
# Color.delete_all
# Fuel.delete_all
# Type.delete_all
# Province.delete_all
# CarModel.destroy_all
# Manufacturer.destroy_all

# Reseed ids
# ActiveRecord::Base.connection.execute(
#   "DELETE FROM sqlite_sequence WHERE name IN (
#     'colors', 'fuels', 'types', 'provinces', 'manufacturers', 'car_models');"
# )

# # Admin credentials
# unless AdminUser.exists?(email: 'admin@example.com')
#   AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
# end

# Import data from a csv file to Manufacturer table
filename_car = Rails.root.join("db/car_data.csv")
puts "Loading Cars from the CSV file: #{filename_car}"
csv_data = File.read(filename_car)

car_data = CSV.parse(csv_data, headers: true, encoding: "utf-8")

# car_data.each do |c|
#   manufacturer = Manufacturer.find_or_create_by(manufacturer_name: c["manufacturer_name"])
# end

car_data.each do |c|
  manufacturer = Manufacturer.find_or_create_by(manufacturer_name: c["manufacturer_name"])

  # Find or create the car model with the manufacturer_id
  # car_model = CarModel.find_or_create_by(
  car_model = CarModel.find_by(
    car_model_name: c["car_model_name"],
    manufacturer_id: manufacturer.id
  )

  unless car_model.image.present?
    query = URI.encode_www_form_component(c["car_model_name"].strip())
    search_url = "https://pixabay.com/api/?key=41243841-a7b2f88d8c9a6b2db69afe153&q=#{query}+car&image_type=photo&pretty=true&page=1&per_page=3"
    response = Net::HTTP.get(URI(search_url))
    search_results = JSON.parse(response)
    image_url = search_results['hits'][0]['webformatURL']
    download_image = URI.open(image_url)
    car_model.image.attach(io:download_image, filename: "#{c["car_model_name"].strip()}.jpg")
    puts c["car_model_name"]
    sleep(31)
  end

  # puts "Created Car Model: #{car_model.car_model_name} (Manufacturer: #{manufacturer.manufacturer_name})"
end

# # Import data from a csv file to Province table
# filename = Rails.root.join("db/provinces_data.csv")
# puts "Loading Provinces from the CSV file: #{filename}"
# csv_data = File.read(filename)
# provinces = CSV.parse(csv_data, headers: true, encoding: "utf-8")

# provinces.each do |row|
#   # puts "Processing row: #{row.inspect}"
#   # puts "province_name: #{row['province_name']}"
#   Province.create(
#     province_name: row["province_name"],
#     pst: row["pst"].presence || 0.0,
#     gst: row["gst"].presence || 0.0,
#     hst: row["hst"].presence || 0.0,
#     total_tax_rate: row["total_tax_rate"].presence || 0.0
#   )
# end

# puts "Created #{Province.count} provinces."

# Colors
# 10.times do
#   color_name = Faker::Vehicle.color
#   Color.find_or_create_by(color_name: color_name)
# end

# Fuel
# 6.times do
#   fuel_name = Faker::Vehicle.fuel_type
#   Fuel.find_or_create_by(fuel_name: fuel_name)
#end

# Type
# 10.times do
#   type_name = Faker::Vehicle.car_type
#   Type.find_or_create_by(type_name: type_name)
# end