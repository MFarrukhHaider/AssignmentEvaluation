Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users,
    controllers: {
    registrations: 'users/registrations'
  }
  resources :users
  resources :comments
  resources :favorite_beers
  root to: "beers#index"
  get '/all_beers', to: "beers#fetch_data_from_public_api"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
