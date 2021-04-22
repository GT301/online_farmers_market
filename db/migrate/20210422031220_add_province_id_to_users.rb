class AddProvinceIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :province_id, :integer
  end
end
