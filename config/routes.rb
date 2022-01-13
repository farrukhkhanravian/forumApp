Rails.application.routes.draw do
  root 'products#index'
  resources :products do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  resources :tags
  put '/product/:id/like', to: 'products#like', as: 'like'
  put '/product/:id/unlike', to: 'products#unlike', as: 'unlike'
  # resource :likes , only: [:create, :destroy]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
