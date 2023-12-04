class CarModelsController < ApplicationController
  def index
    @carModels = CarModel.all
    @manufacturers = Manufacturer.all
  end

  def show
    @carModel = CarModel.find(params[:id])
    @manufacturer = Manufacturer.all.where(@manufacturer == @carModel.manufacturer_id)
  end
end
