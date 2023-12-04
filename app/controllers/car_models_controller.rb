class CarModelsController < ApplicationController
  def index
    @carModels = CarModel.all
  end

  def show
    @carModel = CarModel.find(params[:id])
  end
end
