Rails.application.routes.draw do
  resources :categories, only: %i[index show]
  resources :products, only: %i[index show]

  root to: "products#index"
end
