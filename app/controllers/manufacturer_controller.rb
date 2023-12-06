class ManufacturerController < ApplicationController
  def index
    # @manufacturers = Manufacturer.order(:manufacturer_name)
    # @carModels = CarModel.all

    @manufacturers = Manufacturer.order(:manufacturer_name)
    @selected_letter = params[:letter]&.upcase

    if @selected_letter.present?
      @manufacturers = @manufacturers.where("UPPER(SUBSTR(manufacturers.manufacturer_name, 1, 1)) = ?", @selected_letter)
                                      .order(:manufacturer_name)

      @no_entries_message = "Sorry, there are no entries for the listed letter." if @manufacturers.empty?
    end
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
    @carModel = CarModel.all.where("manufacturer_id" == @manufacturer)
    # @carModels = CarModel.where(manufacturer_id: @manufacturer.id)
  end
end
