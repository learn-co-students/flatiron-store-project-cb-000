class CreateItems < ActiveRecord::Migration[4.2]
  def change
    create_table :items do |t|
    t.string :title
    t.integer :inventory
    t.integer :price
    t.integer :category_id
    end
  end
end
