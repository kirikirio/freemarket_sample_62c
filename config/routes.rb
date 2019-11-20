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

    resources :credits, only: [:index, :new]
    resources :addresses, only: [:edit]
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
      get 'authentication'
      get 'address'
      get 'credit'
      get 'completed'
    end
  end
end
