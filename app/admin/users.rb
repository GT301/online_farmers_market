ActiveAdmin.register User do
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at,
                :remember_created_at, :name, :province_id
end
