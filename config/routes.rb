Rails.application.routes.draw do
  root 'welcome#home'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", registrations: "registrations" }
  resources :categories
  resources :cities do
    resources :categories, only: [:index, :show] do
      resources :branches
    end
  end
end
