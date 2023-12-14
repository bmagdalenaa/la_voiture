class CarModelsController < ApplicationController
  before_action :load_manufacturers, only: [:index]

  def index
    @car_models = CarModel.all
    @no_entries_message = 'Sorry, there are no entries for the listed letter.' if @car_models.empty?

    if params[:manufacturer_id].present? || params[:query].present?
      # Filters by manufacturer if selected
      @car_models = @car_models.where(manufacturer_id: params[:manufacturer_id]) if params[:manufacturer_id].present?

      # Filters by car model name if a keyword is given
      @car_models = @car_models.where('car_model_name LIKE ?', "%#{params[:query]}%") if params[:query].present?
    else
      # If no search bar input is given, use the alphabetical/All filter
      if params[:letter].present?
        selected_letter = params[:letter].upcase
        @car_models = @car_models.where('UPPER(car_model_name) LIKE ?', "#{selected_letter}%")
      elsif params[:number] == 'all_numbers'
        @car_models = @car_models.where('car_model_name RLIKE ?', '^[0-9]')
      end
    end
    @car_models = @car_models.order(:car_model_name).page(params[:page]).per(10)
  end

  def show
    @carModel = CarModel.find(params[:id])
    @manufacturer = Manufacturer.all.where("manufacturer_id" == @manufacturer)
    # @carModels = CarModel.where(manufacturer_id: @manufacturer.id)
  end

  private

  def load_manufacturers
    @manufacturers = Manufacturer.all
  end
end
