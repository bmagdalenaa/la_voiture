class ManufacturerController < ApplicationController
  def index
    @manufacturers = Manufacturer.order(:manufacturer_name)
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end
end
