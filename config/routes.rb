Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [ :show, :edit, :update]  do
    resources :bookings, only: [:new, :create, :destroy]
    resources :cars
  end

end
