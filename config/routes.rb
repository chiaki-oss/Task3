Rails.application.routes.draw do
  # get 'users/show'
  get 'books/index'
  get 'books/show'
  get 'books/new'
  get 'books/edit'
  devise_for :users
  root 'books#index' #ログイン認証後、一覧画面へ
  resources :books
  resources :users, only:[:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
