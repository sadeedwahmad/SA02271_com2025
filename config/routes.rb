Rails.application.routes.draw do
  resources :projects
  devise_for :users
  get 'home/home'
  get 'home/contact'

  root to: "home#home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end