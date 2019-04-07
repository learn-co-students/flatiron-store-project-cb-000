class AddStatusToCart < ActiveRecord::Migration[4.2]
  def change
    add_column :carts, :status, :string, :default => "not submitted"
  end
end
