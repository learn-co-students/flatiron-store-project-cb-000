class CreateCarts < ActiveRecord::Migration[4.2]
  def change
    create_table :carts do |t|
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
