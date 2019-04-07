class AddCurrentCartIdToUsers < ActiveRecord::Migration[4.2]
  def change
    add_reference :users, :current_cart, index: true
  end
end
