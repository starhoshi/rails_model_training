Rails.application.routes.draw do
  resources :push_tokens
  resources :songs
  resources :devices
  root :to => 'users#index'
  #resources :users

  resources :users, only: [:index, :create, :new]
  resource :user, path: '/users/me', only: [:show, :edit, :update, :destroy], defaults: { format: :json }

  resources :song_histories, only: [:index, :create, :new, :edit, :update, :destroy], defaults: { format: :json }
  resource :user, path: '/song_histories/summary', only: [:show], defaults: { format: :json }
  get 'auth/:provider/callback', to: 'callback#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
