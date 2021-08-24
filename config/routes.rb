Rails.application.routes.draw do
  get 'messages/new'
  get 'messages/index'
  get 'messages/show'
  get 'messages/edit'
  get 'tasks/index'
  get 'itineraries/new'
  get 'itineraries/show'
  get 'itineraries/index'
  get 'itineraries/edit'
  get 'roadtrips/new'
  get 'roadtrips/index'
  get 'roadtrips/show'
  get 'roadtrips/edit'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
