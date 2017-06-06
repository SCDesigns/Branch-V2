Rails.application.routes.draw do
  root 'welcome#home'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", registrations: "registrations" }
  resources :categories
  
#Branch-Comment Route
  resources :branches do
    resources :comments
  end

# Full Nested Routes
  resources :cities do
    resources :categories, only: [:index, :show] do
      resources :branches
    end
  end

  get '/recent', to: 'branches#recent'
end
