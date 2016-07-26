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

  get "/users/:id" => "favorites#create", as: "favorite"
  delete "/users/:id" => "favorites#destroy",as:"destroy_favorite"

  match 'top', to: 'comics#top', via: 'get'
  match 'search', to: 'comics#search', via: 'get'

end
