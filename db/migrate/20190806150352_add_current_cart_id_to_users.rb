class AddCurrentCartIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :current_cart_id, :integer
  end
end
