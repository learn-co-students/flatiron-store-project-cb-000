class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, :through => :line_items

  def total
    self.items.collect do |item|
      item.price
    end.sum
  end

  def add_item(item_id)
    Item.find_by(item_id) ? self.line_items.where(item_id: item_id).first_or_initialize : nil
  end
end
