Rails.application.routes.draw do
  get 'sessions/new'

  root 'comics#top'

  get 'signup'    => 'users#new'
  get 'setting'   => 'users#setting', as:"setting"
  get 'login'     => 'sessions#new'
  get 'comic/:id' => 'comics#show'
  post 'login'    => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'history'   => 'users#history'

  resources :comics
  resources :users

  post "/favorites/"      => "favorites#create", as: "favorite"
  delete "/favorites/:id" => "favorites#destroy", as:"destroy_favorite"
  post "/read/"           => "comics#read", as:"read"

  match 'top', to: 'comics#top', via: 'get'
  match 'search', to: 'comics#search', via: 'get'

end
