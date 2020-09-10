Rails.application.routes.draw do

  get 'users/show'
  devise_for :users
  
  root to: "items#index"
  resources :items do
   resources :orders, only:[:create, :index, :new]
  end
  resources :users, only: [:show, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
