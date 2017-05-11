Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'welcome#home'
  # resources :attendees
  resources :cities do
    resources :categories do
      resources :branches
    end
  end

  resources :categories
  resources :branches
end
