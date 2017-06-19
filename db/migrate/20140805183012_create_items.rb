class CreateItems < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.string :title
      t.integer :category_id #item belongs to category
      t.integer :inventory
      t.float :price
      t.timestamps null:false
    end
  end

  def down
    drop_table :items
  end
end
