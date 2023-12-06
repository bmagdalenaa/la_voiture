class ManufacturerController < ApplicationController
  def index
    @manufacturers = Manufacturer.order(:manufacturer_name)
    @carModels = CarModel.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
    @carModel = CarModel.all.where("manufacturer_id" == @manufacturer)
    # @carModels = CarModel.where(manufacturer_id: @manufacturer.id)
  end
end
