Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :clients, only: [:index, :show, :edit, :update]  do
    resources :bookings, only: [:new, :create, :destroy]
  end

  resources :owners only: [:index, :show, :edit, :update] do
    resources :cars
  end
end
