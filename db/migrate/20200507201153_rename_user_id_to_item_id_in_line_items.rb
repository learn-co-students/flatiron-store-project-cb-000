class RenameUserIdToItemIdInLineItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :line_items, :user_id, :item_id
  end
end
