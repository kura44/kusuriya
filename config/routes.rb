Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #ログアウトを押した時dereteメソッドを実行してくれない時の対処
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  root 'welcomes#index'

  resources :users, only: [:show, :index, :edit,:update] do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

  resources :maomaos do
    resources :likes, only: [:create, :destroy]
  end

  resources :templates

  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]

end
