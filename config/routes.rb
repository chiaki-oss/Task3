Rails.application.routes.draw do
  root to:'books#home'
  get 'books/about'
  # get 'users/show'
  # get 'books/index'
  # get 'books/show'
  # get 'books/new'
  # get 'books/edit'
  devise_for :users
  resources :books
  resources :users, only:[:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
