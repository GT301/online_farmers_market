class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.integer :phone_number
      t.references :tax, null: false, foreign_key: true

      t.timestamps
    end
  end
end
