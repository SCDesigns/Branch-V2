Rails.application.routes.draw do
  root 'welcome#home'
  get '/recent', to: 'branches#recent'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", registrations: "registrations" }

# City-Categories-Branches
  resources :cities do
    resources :categories, only: :show do
      resources :branches
    end
  end

# Categories & Branches-Comments
  resources :categories, except: :show
  resources :branches do
    resources :comments
  end
end
