ActiveAdmin.register Vehicle do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :vehicle_name, :vehicle_price, :vin_identification, :vehicle_year, :type_id, :fuel_id, :car_models_id, :color_id, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:vehicle_name, :vehicle_price, :vin_identification, :vehicle_year, :type_id, :car_models_id, :fuel_id, :color_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :car_models_id, as: :select, :collection => CarModel.all
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image, size: '50x50') : ''
    end
    f.actions
  end

end
