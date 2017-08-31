class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.timestamp  null: false
    end
  end
end
