class CreateCarts < ActiveRecord::Migration[4.2]
  def change
    create_table :carts do |t|
    t.integer :user_id
    end
  end
end
