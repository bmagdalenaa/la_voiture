class HomeController < ApplicationController
  def index
    # Placeholder data for testing
    @featured_vehicles = [
      OpenStruct.new(model: 'Placeholder Model 1', image_url: 'nissan-placeholder.jpg', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
      OpenStruct.new(model: 'Placeholder Model 2', image_url: 'nissan-placeholder.jpg', description: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
      OpenStruct.new(model: 'Placeholder Model 3', image_url: 'nissan-placeholder.jpg', description: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
      OpenStruct.new(model: 'Placeholder Model 4', image_url: 'nissan-placeholder.jpg', description: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.')
    ]

    @vehicles = Vehicle.all
    @car_models = CarModel.all
    @car_model = CarModel.all.where("car_models_id" == @car_model)
  end
end
