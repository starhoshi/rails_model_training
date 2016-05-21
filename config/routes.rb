Rails.application.routes.draw do
  resources :push_tokens
  resources :songs
  resources :devices
  root :to => 'users#index'
  #resources :users

  resources :users, only: [:index, :create, :new]
  resource :user, path: '/users/me', only: [:show, :edit, :update, :destroy]

  resources :song_histories
  get 'auth/:provider/callback', to: 'callback#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
