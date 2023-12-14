class ApplicationController < ActionController::Base
  before_action :set_breadcrumbs

  private

  def set_breadcrumbs
    return if is_active_admin_page? || devise_controller? || controller_path == 'searches'
    add_breadcrumb 'Home', :root_path unless controller_name == 'home'

    case controller_name
    when 'car_models'
      add_breadcrumb 'Manufacturers', manufacturers_path
      add_breadcrumb @car_model.manufacturer.name, manufacturer_path(@car_model.manufacturer) if @car_model&.manufacturer
    when 'vehicles'
      add_breadcrumb 'Car Models', car_models_path
      add_breadcrumb @vehicle.car_model.name, car_model_path(@vehicle.car_model) if @vehicle&.car_model
    when 'abouts'
      # breadcrumb_title = action_name == 'show' ? 'About' : action_name.titleize
      # add_breadcrumb breadcrumb_title, about_path unless action_name == 'index'
      add_breadcrumb 'About', about_path unless action_name == 'show'
    when 'contacts'
      # breadcrumb_title = action_name == 'show' ? 'Contact' : action_name.titleize
      # add_breadcrumb breadcrumb_title, contact_path unless action_name == 'index'
      add_breadcrumb 'Contact', contact_path unless action_name == 'show'
    end

    # about/contact - show page
    unless controller_name == 'home' || (['abouts', 'contacts'].include?(controller_name) && action_name == 'show')
      add_breadcrumb controller_name.titleize, controller_index_path
    end

    # Add action name breadcrumb unless on index action
    add_breadcrumb action_name.titleize, action_path unless action_name == 'index'
  end

  def is_active_admin_page?
    request.path.start_with?('/admin')
  end

  def controller_index_path
    url_for(controller: controller_name, action: :index)
  end

  # current action
  def action_path
    url_for(controller: controller_name, action: action_name)
  end
end
