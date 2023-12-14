ActiveAdmin.register CarModel do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #

  permit_params :car_model_name, :manufacturer_id, :description, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:color_name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image, size: '50x50') : ''
    end
    f.actions
  end
end