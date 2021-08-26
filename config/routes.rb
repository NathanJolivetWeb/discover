Rails.application.routes.draw do
  get 'friendships/index'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :roadtrips do
    resources :tasks, only: :create
    resources :messages, only: %i[index create]
    resources :itineraries, only: %i[create new]
    resources :partners, only: %i[create new]
  end
  resources :tasks, only: :delete do
    resources :partnertasks, only: :create
  end
  resources :messages, only: :delete
  resources :itineraries, only: %i[delete update edit show index]
  resources :partners, only: :delete
  resources :profiles, only: %i[update edit show]
  resources :friendships, only: :index
end
