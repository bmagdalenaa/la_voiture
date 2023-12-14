class VehicleController < ApplicationController
  def index
    @vehicles = Vehicle.all
    @car_models = CarModel.all
  end

  def show
    @vehicle = Vehicle.find(params[:id])
    @car_model = CarModel.all.where("car_models_id" == @car_model)
  end
end
