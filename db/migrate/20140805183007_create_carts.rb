class CreateCarts < ActiveRecord::Migration

  def change
    create_table(:carts) do |t|
      #carts belong to a user, therefore need a user_id field.
      t.references :user, foreign_key: true
      t.string :status
    end
  end
end
