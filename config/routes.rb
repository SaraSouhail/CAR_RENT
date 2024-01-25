Rails.application.routes.draw do

  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/destroy'

  devise_for :users
  root to: "pages#home"

  resources :cars
  resources :bookings, only: [:new, :create]

  resources :users, only: [:show, :edit, :update]  do
    resources :bookings, only: [ :edit, :update, :destroy]
  end

end
