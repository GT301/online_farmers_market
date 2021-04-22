ActiveAdmin.register Province do
  permit_params :name, :pst, :gst, :hst, :total_tax_rate
end
