Rails.application.routes.draw do
  devise_for :users
  root 'welcome#home'
  # resources :attendees
  resources :cities do
    resources :categories, only: [:index, :show, :new, :edit]
    resources :branches
  end
end
