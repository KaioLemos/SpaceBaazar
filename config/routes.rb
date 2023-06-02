Rails.application.routes.draw do
  devise_for :users
  root to: "parts#index"
  resources :parts do
    collection do
      get :my_parts
    end
  end
  resources :orders, only: [:index, :new, :create, :show, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
