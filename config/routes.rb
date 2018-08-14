Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :superheroes, only: [ :index, :show ] do
    resources :bookings, only: [ :new, :create ]
  end

  resources :bookings, only: [ :index ]

  namespace :owner do
    resources :superheroes, only: [ :new, :create, :index ]
    resources :bookings, only: [ :index ] do
      patch "validate", to: "bookings#validate"
      patch "decline", to: "bookings#decline"
    end
  end

end
