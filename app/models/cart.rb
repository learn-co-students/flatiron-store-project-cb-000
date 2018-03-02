class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    self.line_items.each do |line_item|
      total += (line_item.item.price * line_item.quantity)
    end
    total
  end

  def add_item(item)
    line_item = LineItem.find_by(cart_id: self.id, item_id: item)
    if line_item
      line_item.quantity += 1
      line_item.save
      line_item
    else
      self.line_items.new(quantity: 1, item_id: item)
    end
  end

  def checkout
    self.line_items.each do |line_item|
      line_item.item.decrease_inventory(line_item.quantity)
    end
    self.status = "sumbitted"
    self.save
    Order.create(cart: self, user: self.user)
  end
end
