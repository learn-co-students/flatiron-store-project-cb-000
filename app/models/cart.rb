class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items
  belongs_to :user

  def add_item(item_id)
    if line_item = self.line_items.find_by(item_id: item_id)
      line_item.quantity += 1
      line_item
    else
      self.line_items.build(item_id: item_id)
    end
  end

  def total
    total = 0
    self.line_items.each {|line_item| total += line_item.item.price * line_item.quantity}
    return total
  end

  def checkout
    self.status = "submitted"
    line_items.each {|line_item| line_item.item.remove(line_item.quantity)}
    user.remove_current_cart
    save
  end

end
