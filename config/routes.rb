Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :users do
  end

  get 'home', to: 'home#index'
end
