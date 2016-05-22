Rails.application.routes.draw do
  get 'ranking/my/songs',to: 'ranking#my_songs',  defaults: { format: :json }
  get 'ranking/my/artists',to: 'ranking#my_artists',  defaults: { format: :json }
  get 'ranking/songs',to: 'ranking#songs',  defaults: { format: :json }
  get 'ranking/artists',to: 'ranking#artists',  defaults: { format: :json }

  resources :push_tokens, defaults: { format: :json }
  resources :songs, defaults: { format: :json }
  resources :devices, defaults: { format: :json }
  root :to => 'users#index'
  #resources :users

  resources :users, only: [:index, :create, :new]
  resource :users, path: '/users/me', only: [:show, :edit, :update, :destroy], defaults: { format: :json }

  resources :song_histories, defaults: { format: :json }
  # resources :song_histories
  get 'auth/:provider/callback', to: 'callback#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
