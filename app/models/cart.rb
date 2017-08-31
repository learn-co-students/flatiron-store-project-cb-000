class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items
  
  belongs_to :user

  def total
    total_amount = 0
    self.line_items.each do |line_item|
      total_amount += line_item.item.price * line_item.quantity
    end
    total_amount
  end

  def add_item(item_id)
    line_item = self.line_items.find_by(item_id: item_id)

    if line_item
      line_item.quantity += 1
    else
      line_item = self.line_items.build(item_id: item_id, quantity: 1)
    end

    line_item
  end

  def checkout
    update(status: "submitted")
    line_items.each do |line_item|
      line_item.item.remove_inventory(line_item.quantity)
    end
    user.remove_cart
  end

end
