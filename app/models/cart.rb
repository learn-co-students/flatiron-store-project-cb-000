class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def add_item(item_id)
    set_item(item_id)
    if items.include?(@item)
      line_item = LineItem.find(@item.id)
      line_item.tap { |l| l.quantity += 1}.save
      line_item
    else
      line_items.new(cart_id: id, item_id: @item.id)
    end
  end

  def total
    i = 0
    items.each do |item|
      quantity = LineItem.find(item.id).quantity
      i += item.price * quantity
    end
    i
  end

  private

  def set_item(item)
    @item = Item.find_by_id(item)
  end
end
