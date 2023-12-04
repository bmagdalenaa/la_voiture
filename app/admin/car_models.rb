ActiveAdmin.register CarModel do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :model_name
  #
  # or
  #
  # permit_params do
  #   permitted = [:color_name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :car_model_name
      f.input :manufacturer_id
      f.input :description
    end
    f.actions
  end

end