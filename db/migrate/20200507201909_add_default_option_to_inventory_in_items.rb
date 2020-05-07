class AddDefaultOptionToInventoryInItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :inventory, :integer, default: 0
  end
end
