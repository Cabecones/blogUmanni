Rails.application.routes.draw do
  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end

  resources :posts do
    resources :comments
  end

  root to: 'posts#index'
end
