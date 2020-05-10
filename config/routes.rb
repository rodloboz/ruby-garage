Rails.application.routes.draw do
  devise_for :users

  resources :cars do
    resource :favorite, only: %i[create destroy]
    resources :bookings, only: :create
    resources :transfers, only: %i[new create]
  end

  resource :garage
  resource :profile, only: %i[edit update]

  resources :manufacturers, only: :index
  resources :models, only: :index

  root to: 'pages#home'
end
