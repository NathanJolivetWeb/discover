Rails.application.routes.draw do
  get 'friendships/index'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :roadtrips do
    resources :tasks, only: %i[new create update edit]
    resources :messages, only: :create
    resources :itineraries, only: %i[create new]
    resources :partners, only: %i[create new]
  end

  resources :tasks, only: :destroy do
    resources :partnertasks, only: :create
  end

  resources :messages, only: :destroy
  resources :itineraries, only: %i[destroy update edit show index] do
    resources :steps, only: %i[create]
  end
  resources :steps, only: :destroy
  resources :partners, only: %i[destroy edit update]
  resources :profiles, only: %i[update edit show]
  resources :friendships, only: :index
end
