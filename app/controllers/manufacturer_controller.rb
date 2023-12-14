class ManufacturerController < ApplicationController
  def index
    @manufacturers = Manufacturer.order(:manufacturer_name)

    if params[:letter].present?
      @selected_letter = params[:letter].upcase
      @manufacturers = @manufacturers.where("UPPER(manufacturer_name) LIKE ?", "#{@selected_letter}%")
    end
    @manufacturers = @manufacturers.page(params[:page]).per(10)
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
    @carModel = CarModel.all.where("manufacturer_id" == @manufacturer)
    # @carModels = CarModel.where(manufacturer_id: @manufacturer.id)
  end

  def search
    @wildcard_search = "%#{params[:keywords]}%"
    @selection = params[:selection]
    @manufacturers = Manufacturer.where(" manufacturer_name LIKE ?", @wildcard_search)
  end
end
