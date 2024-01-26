Rails.application.routes.draw do

  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/destroy'

  devise_for :users
  root to: "pages#home"

  get "profile_client", to: "pages#profile_client", as: :client
  get "profile_owner", to: "pages#profile_owner", as: :owner
  # get "/cars/:id", to: "cars#destroy", as: :delete_car
  get "/bookings/:id", to: "bookings#destroy", as: :delete_booking

  post "/accept_booking/:id", to: "bookings#accept"
  post "/reject_booking/:id", to: "bookings#reject"

  resources :cars do
    resources :bookings, only: [ :new, :create]
  end
  resources :bookings, only: [:index, :edit, :update, :destroy]

end
