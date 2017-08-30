class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity, default: 1
      t.integer :cart_id  #line_item belongs to cart
      t.integer :item_id #this is join table
      t.timestamps null:false
    end
  end
end
