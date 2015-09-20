Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users

  resources :media do
    resources :articles do
      member do
        get 'add_to_medium'
        get 'ban_from_medium'
        get 'send_to_medium'
      end
    end
  end

  resources :sources, except: :show do
    get 'update_all', on: :collection
  end

  root 'media#index'
end
