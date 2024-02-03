Rails.application.routes.draw do
  resources :posts do
    # /posts/5/likes
    scope module: :posts do
      resources :likes, only: [:create, :destroy]
    end
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.


  get "up" => "rails/health#show", as: :rails_health_check
  get "/about", to: "pages#about"
  # Defines the root path route ("/")
  
  authenticated :user do
    root to: 'posts#index', as: :authenticated_user_root
  end

  root "pages#home"
end
