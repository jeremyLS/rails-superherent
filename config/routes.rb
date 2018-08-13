Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :superheroes, only: [ :index, :show ] do
    resources :bookings, only: [ :new, :create ]
  end

  resources :bookings, only: [ :new, :create, :index ]

  resources :users, only: [ :new, :create ]

  namespace :owner do
    resources :superheroes, only: [ :new, :create, :index ]
    resources :bookings, only: [ :index ] do
      patch "validate", to: "bookings#validate"
      patch "decline", to: "bookings#decline"
    end
  end

end


## SUPERHEROES
# - get index
# - get show

## OWNER/SUPERHEROES
# - get new
# - post create
# - get index

## BOOKINGS
# - get new
# - post create
# - get index

## OWNER/BOOKINGS
# - get index
# - patch validate
# - patch decline

## USERS
# - get new
# - post create
