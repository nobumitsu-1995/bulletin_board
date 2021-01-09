Rails.application.routes.draw do
  root 'posts#index'
  resources :posts , only: [:create, :destroy, :index]
  resources :users , only: [:create, :destroy, :update, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
