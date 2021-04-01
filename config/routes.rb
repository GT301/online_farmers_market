Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :categories, only: %i[index show]
  resources :products, only: %i[index show]

  root to: "products#index"
end
