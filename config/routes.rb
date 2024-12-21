Rails.application.routes.draw do
  get "patients/new"
  get "patients/create"
  devise_for :users

  authenticated :user, ->(user) { user.role == "receptionist" } do
    get "receptionist/dashboard", to: "receptionist#dashboard", as: :receptionist_dashboard
    resources :appointments, only: [ :index, :show, :create ]
    resources :patients
  end

  authenticated :user, ->(user) { user.role == "doctor" } do
    get "doctor/dashboard", to: "doctor#dashboard", as: :doctor_dashboard
    resources :appointments, only: [ :index, :show, :create ]
    resources :patients, only: [ :index, :show ]
  end

  resources :users, only: [ :show, :edit, :update ]
  resources :doctors, only: [ :index, :show ]

  resources :patients

  root to: "home#index"
end
