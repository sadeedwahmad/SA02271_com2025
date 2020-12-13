Rails.application.routes.draw do
  resources :profiles
  resources :tasks
  resources :projects


  devise_for :users
  get 'home', to:'home#home'
  post 'request_contact', to: 'home#request_contact'
  get 'contact', to: 'home#contact'
   root to: "home#home"
  #root to: "tasks#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
