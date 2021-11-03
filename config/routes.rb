Rails.application.routes.draw do
  root 'users#index'
  get 'users/:id', to: 'users#show'
  get 'users/:users_id/posts/:id', to: 'posts#show'
  get 'users/:users_id/posts', to: 'posts#index'
end
