Rails.application.routes.draw do\
  root "home#index"

  resources :home, only: %i[index]
  resources :color, only: %i[index show]
  resources :contact_list, only: %i[index show]
  resources :fuel, only: %i[index show]
  resources :manufacturer, only: %i[index show]
  resources :model_colors, only: %i[index show]
  resources :model, only: %i[index show]
  resources :order_details, only: %i[index show]
  resources :type, only: %i[index show]
  resources :vehicle, only: %i[index show]

  # get 'home/index'
  # get 'vehicle/index'
  # get 'vehicle/show'
  # get 'type/index'
  # get 'type/show'
  # get 'order_detail/index'
  # get 'order_detail/show'
  # get 'model/index'
  # get 'model/show'
  # get 'model_color/index'
  # get 'model_color/show'
  # get 'manufacturer/index'
  # get 'manufacturer/show'
  # get 'fuel/index'
  # get 'fuel/show'
  # get 'color/index'
  # get 'color/show'
  # get 'contact_list/index'
  # get 'contact_list/show'
  # get 'color/index'
end
