class AddSubmittedToCarts < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :submitted, :boolean, default: false
  end
end
