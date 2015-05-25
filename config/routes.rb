Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users

  resources :articles
  resources :media, except: :show
  resources :sources, except: :show do
    get 'update_all', on: :collection
  end

  root 'media#index'
end
