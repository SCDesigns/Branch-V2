Rails.application.routes.draw do
  devise_for :users
  root 'welcome#home'
  # resources :attendees
  resources :cities do
    resources :categories, only: [:index, :show, :new, :edit]
    resources :branches, only: [:index, :show, :new, :edit] do
      resources :comments, only: [:new, :index]
    end
  end
end
