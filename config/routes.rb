Rails.application.routes.draw do
 
  get 'book_comments/create'
  get 'book_comments/destroy'
  root to: "home#top"
  get "home/about" =>"home#about",as: "about"
  
  devise_for :users
  
  resources :books, only: [:create, :index, :show, :edit,:update,:destroy] do
    resources :book_comments, only: [:create, :destroy] 
    resource :favorites, only: [:create, :destroy]
  end
  # get "homes/about" =>"homes#about",as: "about"
  # get "homes/about" =>"homes#about",as: "about"
    
  # get 'users/show'
  # get 'users/edit'
  resources :users, only: [:index,:show,:edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
