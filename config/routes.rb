Rails.application.routes.draw do
  root 'posts#index'
  resources :posts , only: [:create, :destroy, :index]
  resources :users , only: [:create, :destroy, :update]
  post 'users/login' => "users#login"
  post 'users/logout' => "users#logout"
  get 'auth/:provider/callback' => 'users#provider_create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
