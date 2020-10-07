Rails.application.routes.draw do
  devise_for :users
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/unsubscribe'
  get 'users/destroy'
  get 'services/index'
  get 'services/show'
  get 'services/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
