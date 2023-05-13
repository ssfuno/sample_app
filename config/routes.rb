Rails.application.routes.draw do
  root 'recipes#index'

  resources :recipes, except: [:index] do
    resources :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create] do
    resources :favorites, only: [:show]
  end
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end