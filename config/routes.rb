Rails.application.routes.draw do
  root 'items#index'
  
  devise_for :users
  resources :users, only: [:show, :new] do
    collection do
      get 'logout'
      get 'select_singup'

    end

    member do
      get 'profile'
    end  
  
  resources :credits, only: [:index, :new, :create]
  resources :addresses, only: [:edit]
  resources :sellings, only: [:index, :show, :edit, :destroy]
  end

  resources :items do

    member do
      get 'confirmation'
      get 'list'
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