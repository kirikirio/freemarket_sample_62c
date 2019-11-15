Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] do
    collection do
      get 'logout'
    end
    resources :credits, only: [:index]
    resources :addresses, only: [:index]
  end
  resources :items, only: [:index,:new, :show]
end
