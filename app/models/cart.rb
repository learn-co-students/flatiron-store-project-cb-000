class Cart < ActiveRecord::Base


  #associations
  has_many   :line_items
  belongs_to :user

  def add_to_cart(item_id)
    return false if !Item.find_by(:id => item_id)
    line_item = self.line_items.find_by(:item_id => item_id)

    if line_item
      line_item.update_attribute(:quantity, line_item.quantity + 1)
    else
      line_item =self.line_items.build(:item_id => item_id)
      line_item.save
    end

  end

  def remove_from_cart(line_item_id)
    if line_item = line_items.find_by(:id => line_item_id)
      self.line_items.delete(line_item.id)
    end
  end

  def total
    sum = 0; self.line_items.each{|i| sum += (i.item.price * i.quantity) }; sum
  end

  def checkout
    order = self.user.orders.create
    order.line_items << self.line_items ;
    self.line_items.delete_all
    order 
  end


end
