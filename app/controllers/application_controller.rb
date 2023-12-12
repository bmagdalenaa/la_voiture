# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :set_breadcrumbs

  private

  def set_breadcrumbs
    return if is_active_admin_page?

    add_breadcrumb 'Home', :root_path

    if controller_name == 'car_models'
      add_breadcrumb 'Manufacturers', manufacturer_index_path
      add_breadcrumb @car_model.manufacturer.name, manufacturer_path(@car_model.manufacturer) if @car_model&.manufacturer
    end

    if controller_name == 'vehicles'
      add_breadcrumb 'Car Models', car_models
      add_breadcrumb @vehicle.car_model.name, car_model_path(@vehicle.car_model) if @vehicle&.car_model
    end

    add_breadcrumb controller_name.titleize, controller_index_path unless controller_name == 'home'
    add_breadcrumb action_name.titleize, action_path unless action_name == 'index'
  end

  private

  def is_active_admin_page?
    request.path.start_with?('/admin')
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
