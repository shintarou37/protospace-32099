Rails.application.routes.draw do
  resources :messages
  devise_for :users
  root to: "prototypes#index"
  resources :prototypes, only:[:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create
  end
  resources :user, only: :show
end
