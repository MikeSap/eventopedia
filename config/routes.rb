Rails.application.routes.draw do
  resources :permission_classes
  resources :technician_bookings
  resources :equipment_bookings
  resources :equipment
  resources :shows
  resources :users
  resources :vendors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
