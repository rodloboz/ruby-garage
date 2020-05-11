Rails.application.routes.draw do
  devise_for :users

  resources :cars do
    resource :favorite, only: %i[create destroy]
    resources :bookings, only: :create
    resources :transfers, only: %i[new create]
  end

  resource :garage
  resource :profile, only: %i[edit update]

  resources :manufacturers, only: :index do
    resources :models, only: :index,
                        controller: 'manufacturers/models'
  end
  resources :models, only: :index

  root to: 'pages#home'
end
