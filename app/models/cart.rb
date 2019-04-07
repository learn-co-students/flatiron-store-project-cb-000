class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
   self.line_items.inject(0){|sum,li|
     sum + (li.quantity * li.item.price)
   }
 end

 def add_item(id)
   @line_item = self.items.find_by(:id=>id)
   if @line_item.nil?
     LineItem.new(:cart_id => self.id,:item_id => id)
   else
     self.line_items.find_by(:item_id =>@line_item.id)
   end
 end

end
