Rails.application.routes.draw do
  require 'sidekiq/web'
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  mount Sidekiq::Web => '/sidekiq'

  post '/admin/admin_users/import_csv', to: 'admin_users#import_csv'
  get '/admin/admin_users/load_data', to: 'admin_users#load_data'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :beers do
    collection do
      get 'beer_info'
    end
    resources :users_comments
    resources :ratings
  end

  resources :users do
    resources :contact_us
  end
  # resources :comments
  # resources :favorite_beers
  get '/:user_id/user_replies', to: 'users#reply'
  # resources :users_comments
  # get 'lrestaurantsogout_user', to: 'users#logout_user'
  root to: 'beers#main_index_page'
  # get '/tags', to: 'users#tagged'

  # get '/beers_for_all', to: 'beers#beer_info'
  # get 'search', to: 'beers#search'

  get '/all_beers', to: 'beers#fetch_data_from_public_api'
  # get '/welcome_email', to: 'registrations#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
