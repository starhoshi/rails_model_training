Rails.application.routes.draw do
  root :to => 'users#index'
  resources :users
  get 'auth/:provider/callback', to: 'callback#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
