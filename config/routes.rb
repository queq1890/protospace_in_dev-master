Rails.application.routes.draw do
  resources :prototypes do
    resources :likes, only: [:create, :destroy]
  end
  devise_for :users
  root 'prototypes#index'
  resources :prototypes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update]
end
