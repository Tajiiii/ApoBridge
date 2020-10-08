Rails.application.routes.draw do
  get 'home/top'
  root :to => 'home#top'

  devise_for :users

  resources :users, only: [:show, :edit, :update, :destroy]
  resources :services, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
