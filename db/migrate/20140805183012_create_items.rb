class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.integer :price
      t.belongs_to :category
    end
  end
end
