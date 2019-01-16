class CreateItems < ActiveRecord::Migration
  def change
    #items have a title, inventory, and price. They belong to a Category, so have category_id as FK
    create_table(:items) do |t|
      t.string :title
      t.integer :inventory
      t.float :price
      t.references :category, foreign_key: true
    end
  end
end
