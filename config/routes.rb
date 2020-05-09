Rails.application.routes.draw do
  devise_for :users

  resources :cars

  root to: 'pages#home'
end
