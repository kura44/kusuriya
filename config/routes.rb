Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:show, :index] 

  resources :maomaos do
    resources :likes, only: [:create, :destroy]
  end
  root 'maomaos#index'
end
