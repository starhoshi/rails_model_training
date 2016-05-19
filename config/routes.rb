Rails.application.routes.draw do
  resources :song_histories
  resources :push_tokens
  resources :songs
  resources :devices
  root :to => 'users#index'
  #resources :users
  resources :users, only: [:index, :create, :new]
  resource :user, path: '/users/me', only: [:show, :edit, :update, :destroy]
  get 'song_histories/:title', to: 'song_histories#show'
  get 'auth/:provider/callback', to: 'callback#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
