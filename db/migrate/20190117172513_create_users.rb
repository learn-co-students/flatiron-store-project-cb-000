class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :current_cart_id
      t.string :email
      t.string :name
      t.string :password_digest
    end
  end
end
