class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user
  
  def total
    total = 0
    items.each do |item|
      quantity = LineItem.find(item.id).quantity
      total += item.price * quantity
    end
    total
  end

  def add_item(item_id)
    item = Item.find(item_id)
    if items.include?(item)
      line_item = LineItem.find(item.id)
      line_item.tap { |li| li.quantity += 1}.save
      line_item
    else
      line_items.new(cart_id: id, item_id: item.id)
    end
  end
end