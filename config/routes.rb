Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :categories, only: %i[index show]
  resources :products, only: %i[index show] do
    collection do
      get :search
      # get :new
    end
  end

  resources :listnew, only: %i[index]
  resources :newupdate, only: %i[index]

  resources :cart, only: %i[index create destroy update]
  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end

  root to: "products#index"
end
