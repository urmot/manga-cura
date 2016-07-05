Rails.application.routes.draw do
  root 'comics#top'

  resources :comics
  resource :users

  #以下今回追加分
  get "/users/:id" => "users#add_favorite", as: "favorite"

  #個人ページからお気に入りを削除する
  delete "/users/:id" => "users#destroy_favorite",as:"destroy_favorite"

  match 'top', to: 'comics#top', via: 'get'
  match 'search', to: 'comics#search', via: 'get'
  match 'login', to: 'users#login', via: 'get'

end
