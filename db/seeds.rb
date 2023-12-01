# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

unless AdminUser.exists?(email: 'admin@example.com')
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
end

# Colors
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

# Model - did not work... error.
# 100.times do
#   Model.create(model_name: Faker::Vehicle.model)
# end