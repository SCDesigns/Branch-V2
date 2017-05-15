Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'welcome#home'
  # resources :attendees
  resources :cities do
    resources :categories, only: [:index, :show] do
      resources :branches
    end
  end

  resources :categories
end
