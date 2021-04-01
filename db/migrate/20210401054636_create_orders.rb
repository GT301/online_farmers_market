class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.decimal :total_price
      t.date :date
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
