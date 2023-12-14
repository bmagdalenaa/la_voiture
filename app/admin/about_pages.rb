ActiveAdmin.register AboutPage do
  permit_params :content

  form do |f|
    f.inputs 'ContactPage Details' do
      f.input :content
    end
    f.actions
  end
end
