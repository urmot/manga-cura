Rails.application.routes.draw do
  root 'comics#top'

  resources :comics
  resource :users

  match 'top', to: 'comics#top', via: 'get'
  match 'search', to: 'comics#search', via: 'get'
  match 'login', to: 'users#login', via: 'get'
end
