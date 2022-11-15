require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :recipes, only: :index
      resources :learning_resources, only: :index
      resources :users, only: :create
      resources :favorites, only: %i[index create]
      delete '/favorite', to: 'favorites#destroy'
      resources :tourist_sights, only: :index
    end
  end

  mount Sidekiq::Web => '/sidekiq'
end
