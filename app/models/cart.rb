class Cart < ActiveRecord::Base
		belongs_to :user
		has_many :line_items
		has_many :items, through: :line_items
		
  def total 
   	total = 0
  	self.line_items.each do |line_item|
  	  quantity = line_item.quantity
  		item = Item.find(line_item.item_id)
  		price = Item.find(item.id).price 
		  total += (quantity * price)
  	end 
  	total
  end 

	def items
		line_items.collect do |line_item|
	    line_item.item
		end 
	end 

	def add_item(item_id) 
		item = Item.find(item_id)
	 	LineItem.all.map do |line_item|
	    if line_item.item.id == item_id
		    line_item.quantity = (line_item.quantity + 1)
	      return line_item
	    else
		    return item.line_items.build(quantity: 1, cart: self, item_id: item.id)
	    end
	  end
	end 
end
