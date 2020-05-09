Rails.application.routes.draw do
  devise_for :users

  resources :cars do
    resource :favorite, only: %i[create destroy]
    resources :bookings, only: :create
    resources :transfers, only: %i[new create]
  end

  resource :garage
  resource :profile, only: %i[edit update]

  root to: 'pages#home'
end
