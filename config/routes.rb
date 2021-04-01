Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  get 'categories/index'
  get 'categories/show'
  get 'products/index'
  get 'products/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
