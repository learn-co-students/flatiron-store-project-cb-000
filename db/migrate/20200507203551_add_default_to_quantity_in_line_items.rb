class AddDefaultToQuantityInLineItems < ActiveRecord::Migration[5.0]
  def up
    change_column :line_items, :quantity, :integer, default: 1
  end

  def down
    change_column :line_items, :quantity, :integer
  end
end
