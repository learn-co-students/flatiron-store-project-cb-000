class CreateLineItems < ActiveRecord::Migration[4.2]
  def change
    create_table :line_items do |t|
      t.belongs_to :cart
      t.belongs_to :item
      t.integer :quantity, :default => 1
    end
  end
end
