Rails.application.routes.draw do
  root 'items#index'
  
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'} 
  resources :users, only: [:show, :new, :edit] do
    collection do
      get 'logout'
      get 'select_singup'

    end

    member do
      get 'profile'
    end  
  
  resources :credits, only: [:index, :new, :create]
  resources :sellings, only: [:index, :show, :destroy]
  end

  resources :items, only: [:index, :show,:edit, :new,:create,:update] do

    member do
      get 'confirmation'
      get 'list'
      patch 'buy'
      get 'buy_completed'
    end
  end

  resources :signup, except: [:index, :new, :create, :edit, :show, :update, :destroy] do
    collection do
      get 'registration'
      post 'authentication'
      post 'address'
      post 'credit'
      post 'completed'
    end
  end
end