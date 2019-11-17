Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :new] do
    collection do
      get 'logout'
      get 'completed'
    end

    member do
      get 'authentication'
      get 'select_singup'
      get 'profile'
    end  

    resources :credits, only: [:index, :new]
    resources :addresses, only: [:new, :edit]
  end
  resources :items, only: [:index,:new, :show, :edit] do

    member do
      get 'confirmation'
    end
  end
end
