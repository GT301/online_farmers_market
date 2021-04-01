class CreateTaxes < ActiveRecord::Migration[6.1]
  def change
    create_table :taxes do |t|
      t.string :province_name
      t.float :rate

      t.timestamps
    end
  end
end
