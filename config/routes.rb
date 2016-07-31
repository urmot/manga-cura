Rails.application.routes.draw do
  get 'sessions/new'

  root 'comics#top'

  get 'signup'    => 'users#new'
  get 'setting'   => 'users#setting', as:"setting"
  get 'login'     => 'sessions#new'
  get 'comic/:id'     => 'comics#show'
  post 'login'    => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :comics
  resources :users

  post "/favorites/" => "favorites#create", as: "favorite"
  delete "/favorites/:id" => "favorites#destroy", as:"destroy_favorite"

  match 'top', to: 'comics#top', via: 'get'
  match 'search', to: 'comics#search', via: 'get'

end
