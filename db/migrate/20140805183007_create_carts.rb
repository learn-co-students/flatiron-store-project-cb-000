class CreateCarts < ActiveRecord::Migration[4.2]
  def change
    create_table :carts do |t|
      t.belongs_to :user
    end
  end
end
