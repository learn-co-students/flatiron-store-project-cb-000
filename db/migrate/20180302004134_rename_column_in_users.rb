class RenameColumnInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :current_cart_id, :cart_id
  end
end
