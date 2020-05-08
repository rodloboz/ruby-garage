Rails.application.routes.draw do
  devise_for :users

  resources :cars, only: %i[index show new create]

  root to: 'pages#home'
end
