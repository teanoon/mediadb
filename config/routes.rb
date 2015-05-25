Rails.application.routes.draw do
  devise_for :users

  resources :articles
  resources :media, except: :show
  resources :sources, except: :show do
    get 'update_all', on: :collection
  end

  root 'media#index'
end
