# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :set_breadcrumbs

  private

  def set_breadcrumbs
    add_breadcrumb 'Home', :root_path

    if controller_name == 'car_models'
      add_breadcrumb 'Manufacturers', manufacturer_index_path
      # Only add this if @car_model is set and has an associated manufacturer
      add_breadcrumb @car_model.manufacturer.name, manufacturer_path(@car_model.manufacturer) if @car_model&.manufacturer
    end

    if controller_name == 'vehicles'
      add_breadcrumb 'Car Models', car_models
      # Only add this if @vehicle is set and has an associated car model
      add_breadcrumb @vehicle.car_model.name, car_model_path(@vehicle.car_model) if @vehicle&.car_model
    end

    # Add controller name breadcrumb unless it's the 'home' controller
    add_breadcrumb controller_name.titleize, controller_index_path unless controller_name == 'home'

    # Add action name breadcrumb unless it's the 'index' action
    add_breadcrumb action_name.titleize, action_path unless action_name == 'index'
  end

  # Helper to generate path for the controller's index action
  def controller_index_path
    url_for(controller: controller_name, action: :index)
  end

  # Helper to generate path for the current action
  def action_path
    url_for(controller: controller_name, action: action_name)
  end
end
