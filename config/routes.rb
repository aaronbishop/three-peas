Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Recipes + ingredients
      resources :recipes do
        resources :ingredients
        resources :comments, only: [ :index, :create, :destroy ]
        resource  :favorite, only: [ :create, :destroy ] # singular → one favorite per recipe per user
      end

      # Favorites index (all saved recipes for current user)
      resources :favorites, only: [ :index ]

      # Search routes
      get "recipes/search", to: "recipes#search"
      get "ingredients/search", to: "ingredients#search"

      # User management
      resources :users, only: [ :index, :show, :update, :destroy ]
      post "/signup", to: "users#create"
      get "/me", to: "users#me"

      # Authentication
      post "/login", to: "sessions#create"
      delete "/logout", to: "sessions#destroy"
    end
  end

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Root path
  root "recipes#index"
end
