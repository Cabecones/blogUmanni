Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  resources :posts
  resources :users
  resources :admins

  root to: 'posts#index'
  get 'login', to: 'admins#login'
  get 'logout', to: 'admins#logout'
  post 'new_post/:id', to: 'posts#create'
  post 'post_edit/:id', to: 'posts#update'
  delete 'post/:id', to: 'posts#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
