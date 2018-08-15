Rails.application.routes.draw do
  get 'bookings/index'
  devise_for :users
  root to: 'pages#home'

  resources :superheroes, only: [ :index, :show ] do
    resources :bookings, only: [ :new, :create ]
  end

  resources :bookings, only: [ :index ]

  namespace :owner do
    resources :superheroes, only: [ :new, :create, :index ]
    resources :bookings, only: [ :index ] do
      member do
        patch :validate
        patch :decline
      end
    end
  end

end
