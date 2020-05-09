Rails.application.routes.draw do
  devise_for :users

  resources :cars do
    resource :favorite, only: %i[create destroy]
  end

  root to: 'pages#home'
end
