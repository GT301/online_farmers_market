ActiveAdmin.register Order do
  permit_params :total_price, :order_status, :user_id, :province_id, :tax
end
