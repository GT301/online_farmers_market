ActiveAdmin.register Product do
  permit_params :product_name, :price, :stock, :description, :category_id
end
