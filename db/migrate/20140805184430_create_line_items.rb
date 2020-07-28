class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :cart_id
      t.integer :user_id
      t.integer :quantity
    end
    add_index :line_items, :cart_id
    add_index :line_items, :user_id
  end
end
