Rails.application.routes.draw do
  devise_for :users

  authenticated :user, ->(user) { user.role == "receptionist" } do
    root to: 'receptionist#dashboard', as: :receptionist_root
    resources :appointments, only: [:index, :show, :create]
  end

  authenticated :user, ->(user) { user.role == "doctor" } do
    root to: 'doctor#dashboard', as: :doctor_root
    resources :appointments, only: [:index, :show, :create]
  end

  resources :users, only: [:show, :edit, :update]
  resources :doctors, only: [:index, :show]

  root to: 'home#index'
end
