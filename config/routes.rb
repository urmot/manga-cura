Rails.application.routes.draw do
  get 'sessions/new'

  root 'comics#top'

  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :comics
  resources :users

  match 'top', to: 'comics#top', via: 'get'
  match 'search', to: 'comics#search', via: 'get'
  match 'login', to: 'users#login', via: 'get'
end
