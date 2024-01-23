Rails.application.routes.draw do
  get 'cars/index'
  get 'cars/show'
  get 'cars/new'
  get 'cars/create'
  get 'cars/update'
  get 'cars/edit'
  get 'cars/destroy'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/destroy'
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:show, :edit, :update]  do
    resources :bookings, only: [:new, :create, :destroy]
    resources :cars
  end

end
