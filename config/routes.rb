Rails.application.routes.draw do
  root "home#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
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

  get '/about', to: 'abouts#show', as: :about
  get '/contact', to: 'contacts#show', as: :contact
  resources :cart
  resources :checkout, only: %i[index]
  get 'search', to: 'searches#result', as: 'global_search'

  resources :car_models, only: %i[index show] do
    collection do
      get 'search', to: 'car_models#search', as: 'search'  # This will give you a path to car_models/search
    end
  end

  resources :manufacturers, only: %i[index show] do
    collection do
      get 'search', to: 'manufacturers#search', as: 'search'  # This will give you a path to manufacturers/search
    end
  end

  # resources :cart, only: [:show] do
  #   member do
  #     post :add
  #     patch :update
  #     delete :remove
  #   end
  # end

  # resources :checkout, only: [:create]
  # scope "/checkout" do
  #   post "create", to: "checkout#create", as: "checkout_create"
  #   get "success", to: "checkout#success", as: "checkout_success"
  #   get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  # end

end
