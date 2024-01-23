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

  resources :clients, only: [:index, :show, :edit, :update]  do
    resources :bookings, only: [:new, :create, :destroy]
  end

  resources :owners ,only: [:index, :show, :edit, :update] do
    resources :cars
  end
end
