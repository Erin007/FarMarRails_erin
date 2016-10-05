class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :amount
      t.string :purchase
      t.integer :vendor_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end