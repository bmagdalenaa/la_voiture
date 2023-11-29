Rails.application.routes.draw do\
  root "home#index"

  get 'home/index'
  get 'vehicle/index'
  get 'vehicle/show'
  get 'type/index'
  get 'type/show'
  get 'order_detail/index'
  get 'order_detail/show'
  get 'model/index'
  get 'model/show'
  get 'model_color/index'
  get 'model_color/show'
  get 'manufacturer/index'
  get 'manufacturer/show'
  get 'fuel/index'
  get 'fuel/show'
  get 'color/index'
  get 'color/show'
  get 'contact_list/index'
  get 'contact_list/show'
  get 'color/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

end
