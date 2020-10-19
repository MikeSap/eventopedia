Rails.application.routes.draw do
  root 'sessions#index'

  # resources :permission_classes
  # resources :technician_bookings
  # resources :equipment_bookings
  # resources :equipment
  # resources :shows
  # resources :users
  # resources :vendors
  resources :sessions, only: [:new, :create, :destroy]
  
  
  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'
  # post '/logout' => 'sessions#destroy'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
