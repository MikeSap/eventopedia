Rails.application.routes.draw do
  root 'sessions#index'

  # resources :permission_classes
  # resources :technician_bookings
  # resources :equipment_bookings
  resources :equipment
  # resources :shows
  resources :vendors, only: [:new, :create]
  resources :sessions, only: [:new ,:destroy]
  resources :users
  
  get 'login' => 'sessions#login'
  post 'login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
