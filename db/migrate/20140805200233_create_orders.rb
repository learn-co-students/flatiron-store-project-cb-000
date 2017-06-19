class CreateOrders < ActiveRecord::Migration
  def up
    create_table :orders do |t|
      t.integer :user_id
      t.timestamps null:false
    end
  end

  def down
    drop_table :orders
  end
end
