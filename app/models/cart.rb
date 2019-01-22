class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

#method to calculate the sum price of items in a cart
  def total
    #take all of the line items, put them in a collect loop, so that values are saved.
    self.line_items.collect do |line_item|
      #for each line_item inside of the cart, take the price and multiply it by how many of that line_item there are
       line_item.item.price * line_item.quantity
    #get sum of the price.
    end.sum
   end

   def add_item(item_id)
     l_item = self.line_items.find_by(item_id: item_id)
     if l_item
       l_item.quantity += 1
       l_item
     else
      self.line_items.build(item_id: item_id)
     end
   end

   def checkout
    self.status = "submitted"
    line_items.each {|line_item| line_item.item.remove(line_item.quantity)}
    user.remove_current_cart
    save

  end

end
