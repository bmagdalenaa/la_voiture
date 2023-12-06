Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :home, only: %i[index]
  resources :provinces, only: %i[index show]
  resources :color, only: %i[index show]
  resources :contact_list, only: %i[index show]
  resources :fuel, only: %i[index show]
  resources :manufacturer, only: %i[index show]
  resources :model_color, only: %i[index show]
  resources :car_models, only: %i[index show]
  resources :order_details, only: %i[index show]
  resources :type, only: %i[index show]
  resources :vehicle, only: %i[index show]
  resources :abouts
  resources :contacts
  root "home#index"
end
