class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.decimal :price
      t.integer :inventory
      t.references :category, index: true
    end
    add_foreign_key :items, :categories
  end
end
