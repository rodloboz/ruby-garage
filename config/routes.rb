Rails.application.routes.draw do
  devise_for :users

  resources :cars do
    resource :favorite, only: %i[create destroy]
    resources :bookings, only: [:create]
  end

  resource :garage

  root to: 'pages#home'
end
