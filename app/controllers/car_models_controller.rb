class CarModelsController < ApplicationController
  def index
    @carModels = CarModel.all
    @manufacturers = Manufacturer.all
    @selected_letter = params[:letter]&.upcase
    @selected_number = params[:number]

    if @selected_letter.present?
      @car_models = CarModel.where("UPPER(SUBSTR(car_model_name, 1, 1)) = ?", @selected_letter)
                          .order(:car_model_name)
    elsif @selected_number.present? && @selected_number != 'all_numbers'
      @car_models = CarModel.where("UPPER(SUBSTR(car_model_name, 1, 1)) IN ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9') OR car_model_name LIKE ?", "#{@selected_number}%")
                          .order(:car_model_name)
    else
      @car_models = CarModel.order(:car_model_name)
    end
    @no_entries_message = "Sorry, there are no entries for the listed letter." if @car_models.empty?
  end

  def show
    @carModel = CarModel.find(params[:id])
    @manufacturer = Manufacturer.all.where(@manufacturer == @carModel.manufacturer_id)
  end
end
