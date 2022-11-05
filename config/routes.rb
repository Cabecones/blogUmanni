Rails.application.routes.draw do
  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end

  resources :posts

  root to: 'posts#index'

  #metodos de posts
  get 'posts', to: 'posts#index'
  get 'posts/new', to: 'posts#new'
  get 'posts_show/:id', to: 'posts#show'
  get 'posts/:id/edit', to: 'posts#edit'
  post 'posts', to: 'posts#create'
  patch 'posts/:id', to: 'posts#update'
  delete 'posts_delete/:id', to: 'posts#destroy'
end
