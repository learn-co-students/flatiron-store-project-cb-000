class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :status
      t.references :user, index: true
    end
    add_foreign_key :carts, :users
  end
end
