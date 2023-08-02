Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :beers do
    resources :users_comments
    resources :ratings
  end
  resources :users
  resources :comments
  resources :favorite_beers

  # resources :users_comments
  # get 'logout_user', to: 'users#logout_user'
  root to: "beers#index1"
  get '/all_beers', to: "beers#fetch_data_from_public_api"
  # get '/welcome_email', to: 'registrations#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
