Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  get 'categories/show'
  get 'home/top'
  root :to => 'home#top'

  devise_for :users

  resources :users, only: [:show, :edit, :update, :destroy] do
    member do
      get :following, :followers
    end
    collection do
      get :likes
    end
  end
  resources :relationships, only: [:create, :destroy]
  get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'user_unsubscribe'
  
  resources :services, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :categories, only: [:show]

  resources :relationships, only: [:create, :destroy]

  resources :notifications, only: [:index, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
