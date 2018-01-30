class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders  do |t|
      t.decimal :tax
      t.decimal :shipping
      t.integer :customer_id
      t.string  :status

      t.timestamps  null: false
    end
  end
end
