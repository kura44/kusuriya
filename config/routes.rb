Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #ログアウトを押した時dereteメソッドを実行してくれない時の対処
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  

  resources :users, only: [:show, :index] 

  resources :maomaos do
    resources :likes, only: [:create, :destroy]
  end
  root 'maomaos#index'
end
