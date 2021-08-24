Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :roadtrips do
    resources :tasks, only: :create
    resources :messages, only: %i[index create]
    resources :itineraries, only: :create
    resources :partners, only: :create
  end
  resources :tasks, only: :delete do
    resources :partnerTasks, only: :create
  end
  resources :messages, only: :delete
  resources :itineraries, only: %i[delete update edit show index]
  resources :partners, only: :delete
end
