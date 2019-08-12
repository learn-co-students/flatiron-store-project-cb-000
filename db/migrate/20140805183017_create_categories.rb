class CreateCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :categories do |t|
    t.string :title
    end
  end
end
