class ChangeColumnSubmittedToStatusInCarts < ActiveRecord::Migration[5.0]
  def change
    change_column :carts, :submitted, :integer, default: 1
    rename_column :carts, :submitted, :status
  end
end
