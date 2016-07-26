Rails.application.routes.draw do
  get 'sessions/new'

  root 'comics#top'

  get 'signup'    => 'users#new'
  get 'setting'   => 'users#setting', as:"setting"
  get 'login'     => 'sessions#new'
  post 'login'    => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :comics
  resources :users

  post "/favorites/" => "favorites#create", as: "create"
  delete "/favorites/:id" => "favorites#destroy", as:"destroy"

  match 'top', to: 'comics#top', via: 'get'
  match 'search', to: 'comics#search', via: 'get'

end
