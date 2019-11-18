Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :new] do
    collection do
      get 'logout'
      get 'select_singup'
      get 'completed'
    end

    member do
      get 'authentication'
      get 'profile'
    end  

    resources :credits, only: [:index, :new]
    resources :addresses, only: [:new, :edit]
  end
  resources :items do

    member do
      get 'confirmation'
      get 'list'
    end
  end
end
