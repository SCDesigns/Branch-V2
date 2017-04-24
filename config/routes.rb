Rails.application.routes.draw do
  devise_for :users
  root 'welcome#home'
  resources :attendees
  resources :branches
  resources :comments
  resources :cities do
    resources :categories, only: [:index, :show, :new, :edit]
  end
end
