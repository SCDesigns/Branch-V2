Rails.application.routes.draw do
  root 'welcome#home', as: 'home'
  resources :attendees
  resources :cities
  resources :comments
  resources :categories
  devise_for :users
  resources :branches
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
