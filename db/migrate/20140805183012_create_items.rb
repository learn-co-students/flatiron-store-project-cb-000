class CreateItems < ActiveRecord::Migration
  def change
  	create_table :items do |t|
  		t.string :title
  		t.string :price
  	end
  end
end
