Rails.application.routes.draw do
  root to: 'homes#top'
  get '/home/about' => 'homes#about'
  devise_for :users
  resources :books, only: [:show, :edit, :index, :destroy, :create, :update]
  resources :users, only: [:show, :index, :update]
  get 'users/:id/edit' => 'users#edit', as: 'edit_user'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
 