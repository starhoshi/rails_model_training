Rails.application.routes.draw do
  resources :push_tokens
  resources :songs
  resources :devices
  root :to => 'users#index'
  #resources :users

  resources :users, only: [:index, :create, :new]
  resource :user, path: '/users/me', only: [:show, :edit, :update, :destroy], defaults: { format: :json }

  resource :song_histories, only: [:show, :create, :new, :edit, :update, :destroy], defaults: { format: :json }
  get 'song_histories/summary', to: 'song_histories#index', defaults: { format: :json }
  get 'auth/:provider/callback', to: 'callback#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
