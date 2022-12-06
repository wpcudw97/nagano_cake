class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :postage
      t.integer :payment_method
      t.integer :total_payment
      t.integer :status
      t.detetime :created_at
      t.detetime :update_at
      t.timestamps
    end
  end
end
