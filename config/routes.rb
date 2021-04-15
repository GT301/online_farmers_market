Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :categories, only: %i[index show]
  resources :products, only: %i[index show] do
    collection do
      get :search
    end
  end

  root to: "products#index"
end
