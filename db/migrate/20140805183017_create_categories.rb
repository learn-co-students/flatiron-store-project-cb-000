class CreateCategories < ActiveRecord::Migration
  def change
    create_table(:categories) do |t|
      #categories have a title
      t.string :title
    end
  end
end
