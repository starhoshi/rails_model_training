Rails.application.routes.draw do
  root :to => 'users#index'
  get 'users/login',to: 'users#index',  defaults: { format: :html }
  get 'auth/:provider/callback', to: 'callback#create'

  namespace :api, { format: 'json' } do
    namespace :v1 do

      resources :playlist_songs,  defaults: { format: :json }
      put '/playlists/:id', to: 'playlists#update_songs'
      patch '/playlists/:id', to: 'playlists#update_name'
      resources :playlists,  defaults: { format: :json }

      get 'ranking/my/songs',to: 'ranking#my_songs',  defaults: { format: :json }
      get 'ranking/my/artists',to: 'ranking#my_artists',  defaults: { format: :json }
      get 'ranking/songs',to: 'ranking#songs',  defaults: { format: :json }
      get 'ranking/artists',to: 'ranking#artists',  defaults: { format: :json }

      resources :push_tokens, defaults: { format: :json }
      resources :songs, defaults: { format: :json }
      resources :devices, defaults: { format: :json }
      #resources :users

      resources :users, only: [:create, :new]
      resource :users, path: '/users/me', only: [:show, :edit, :update, :destroy], defaults: { format: :json }

      resources :song_histories, defaults: { format: :json }
    end
  end
end
