Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  
  get '/search', to: 'searches#search'

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]do
  resource :favorites, only: [:create,:destroy]
  resources :book_comments, only: [:create,:destroy]
end 
  resources :users, only: [:index,:show,:edit,:update] do
 member do
   get :follows, :followers
  end
  resource :relationships, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end 
