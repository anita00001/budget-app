Rails.application.routes.draw do
  devise_for :users

  root to: 'categories#index'

  get 'home', to: 'home#index'

  resources :categories do
    resources :cash_flows
  end
end
